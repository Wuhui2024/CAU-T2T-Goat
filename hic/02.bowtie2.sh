#!/usr/bash
set -e
date
hostname
/export/personal/zoum/bin/perl /export/personal/pengh/Software/bowtie2-2.3.2-legacy/bowtie2 --very-sensitive -L 30 --score-min L,-0.6,-0.2 --end-to-end --reorder --phred33-quals -p 4  --no-sq --un trim/0005.rsy.R2.unmap.fastq --rg-id BMG --rg SM:0005.rsy.R2 -x /sugon/personal1/project/BJXWZ-202205112-01_rongshanyang_v2/03_Assembly/T2T/quality_Assessment/hi-c/midfile/rsy.Contig.fasta -U /sugon/personal1/project/BJXWZ-202205112-01_rongshanyang_v2/03_Assembly/T2T/quality_Assessment/hi-c/01_QC/0005.rsy.clean_R2.fq.gz | /export/personal/mengmh/software/samtools-1.4/samtools view -F 4 -@ 2 -t /sugon/personal1/project/BJXWZ-202205112-01_rongshanyang_v2/03_Assembly/T2T/quality_Assessment/hi-c/midfile/rsy.Contig.fasta.fai -bS -> tmp/0005.rsy.R2.bam
touch /sugon/personal1/project/BJXWZ-202205112-01_rongshanyang_v2/03_Assembly/T2T/quality_Assessment/hi-c/02_MAP/bowtie2/01.cmd.bwotie.sh.qsub/rsy10.sh.done
