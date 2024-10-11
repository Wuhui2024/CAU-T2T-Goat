# 01 bwa mem
bwa  mem -t 5  -k 23 -M -R \"@RG\\tID:sample\\tSM:sample\\tPL:illumina\" reference.fasta sample_trim_1P.fastq.gz  sample_trim_2P.fastq.gz  | samtools view --threads 5 -bhS | samtools sort --threads 5 -m 3G -o  sample.sort.bam
#02 rmdup
samtools index -@ 10 sample.sort.bam 
samtools rmdup -s  sample.sort.bam  sample.sort.rmdup.bam
samtools index -@  10 sample.sort.rmdup.bam
#03  GATK
gatk   HaplotypeCaller  --native-pair-hmm-threads 15   -R  reference.fasta    -I  sample.sort.rmdup.bam     -ERC GVCF  -O  sample.g.vcf.gz
#04 make DBI 
gatk  --java-options  \"-Xmx20G -Djava.io.tmpdir=./tmp\"   GenomicsDBImport    --reader-threads 5  --sample-name-map ./DBI.list    --batch-size 100   --tmp-dir  ./tmp/  -R   reference.fasta  --genomicsdb-workspace-path  my_database/${chr}/${chr}   --intervals ${chr}
#05 gatk Genotype
gatk --java-options \" -Xmx10G -Djava.io.tmpdir=./tmp \"  GenotypeGVCFs -R reference.fasta \
        -V /my_database/${chr}/${chr}/  \
        -L ${chr} \
         -L ${chr} \
        -O  01_listgvcfs/${chr}.vcf.gz \
        --only-output-calls-starting-in-intervals  --merge-input-intervals \
        --tmp-dir ./tmp/

#06 mergr chr vcf
gatk MergeVcfs  --java-options \" -Xmx10G -Djava.io.tmpdir=./tmp \"  -I  ${chr}.list  -O  /${chr}.merge.vcf.gz
#07 filter vcf
#select snp
gatk --java-options  "-Xmx30G -Djava.io.tmpdir=./tmp" SelectVariants -V  ${chr}.merge.vcf.gz   --select-type-to-include SNP -R  reference.fasta  -O ${chr}.raw.snp.vcf.gz
# Hard-filtering
gatk --java-options "-Xmx30G -Djava.io.tmpdir=./tmp " VariantFiltration -V ${chr}.raw.snp.vcf.gz \
    -O  ${chr}.snp_filter.tmp.vcf.gz       \
    -filter "QD < 2.0" --filter-name "QD2"     \
    -filter "QUAL < 30.0" --filter-name "QUAL30"     \
    -filter "SOR > 3.0" --filter-name "SOR3"     \
    -filter "FS > 60.0" --filter-name "FS60"     \
    -filter "MQ < 40.0" --filter-name "MQ40"     \
    -filter "MQRankSum < -12.5"  --filter-name "MQRankSum-12.5"   \
    -filter "ReadPosRankSum < -8.0" --filter-name "ReadPosRankSum-8"
# filter pass
gatk  --java-options " -Xmx30G -Djava.io.tmpdir=./tmp "  SelectVariants -V ${chr}.snp_filter.tmp.vcf.gz     \
-O  ${chr}.snp_filter.vcf.gz   --restrict-alleles-to BIALLELIC    --exclude-filtered
#  filter SNP by minor allele frequency (MAF) and missing rate 
vcftools --gzvcf  ${chr}.snp_filter.vcf.gz --recode  --recode-INFO-all  --out ${chr}.snp.finally_filter    --maf 0.05  --max-missing 0.9
