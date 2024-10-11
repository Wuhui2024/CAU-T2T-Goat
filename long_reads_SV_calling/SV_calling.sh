###### 01 mapping
minimap2  --secondary=no -t 20   -R  '@RG\tID:BEG\tSM:sample'   -ax  map-hifi reference.fa  hifi.fa.gz  | samtools view --threads 10 -T  ${ref}   -bS | samtools sort --threads 8 -m 10G -o sample.sort.bam 
samtools index  -@ 10 sample.sort.bam

###### 02 calling
###### sv calling using cutesv 
cuteSV --max_cluster_bias_INS  1000  --diff_ratio_merging_INS     0.9      --max_cluster_bias_DEL  1000  --diff_ratio_merging_DEL  0.5  --genotype  -t 10   sample.sort.bam reference.fa     sample.vcf  /workdir/


###### sv calling using pbsv
pbsv  discover  sample.align.bam  sample.svsig.gz 
pbsv call  --ccs   --num-threads 20   reference.fa   sample.svsig.gz  sample.pbsv.vcf


###### sv calling using sniffles
sniffles   --threads  20   --input sample.sort.bam   --vcf  sample.vcf


###### merge three software SV dataset
SURVIVOR merge  sample_vcf.list  1000 2 1 0 0 50   sample.merge.vcf


###### merge all sample SV dataset
SURVIVOR merge  allsample_vcf_list  1000 1 1 0 0 50   allsample.merge.vcf
