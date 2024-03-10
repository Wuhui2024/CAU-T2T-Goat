#!bin/bash
set -vex

#01 make index
/software/bowtie2/v2.4.2/bowtie2-build  --threads 20  rsy.finally.fasta   rsy.finally.fasta
samtools  faidx  rsy.finally.fasta

#02 maping CENP
/software/bowtie2/v2.4.2/bowtie2   -p 20   --very-sensitive --no-mixed --no-discordant -k 10   -x   rsy.finally.fasta   -1  IP1118-2P-CENP-A_1.clean.fq.gz  -2  IP1118-2P-CENP-A_2.clean.fq.gz  | samtools sort -O bam -@ 10 -o - > rsy.CENP.bam

#03 mapping INPUT
/software/bowtie2/v2.4.2/bowtie2   -p 20  --very-sensitive --no-mixed --no-discordant -k 10    -x  rsy.finally.fasta   -1  INPUT1118-2_1.clean.fq.gz  -2  INPUT1118-2_2.clean.fq.gz  | samtools sort -O bam -@ 10 -o - >  rsy.INPUT.bam

#macs3
/software/anaconda3/bin/macs3    callpeak   -t  rsy.CENP.bam   -c  rsy.INPUT.bam  -g   2.85e9  -f  BAM  -n hy  -B -q 0.01
