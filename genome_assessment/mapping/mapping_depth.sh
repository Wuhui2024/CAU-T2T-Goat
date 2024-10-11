#### 01 minimap2 
minimap2   --secondary=no -t 40 -ax  map-hifi   ref.fa   hifi.fa.gz  | samtools view --threads 10 -T   ref.fa   -bS | samtools sort --threads 8 -m  3G -o  ref.sort.bam 
samtools index  -@ 20  ref.sort.bam

#02 bamdst
/bamdst -p ref.bed -o  ${outdir}   ${bam}
