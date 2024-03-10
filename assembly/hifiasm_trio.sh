#!/bin/bash
set -ex


yak count -k 23  -b 37 -t 20 -o  IMCGF.yak <(zcat IMCGF.clean.r1.fastq.gz ) <(zcat IMCGF.clean.r2.fastq.gz)


yak count -k 23  -b 37 -t 20 -o  IMCGM.yak <(zcat IMCGM.clean.r1.fastq.gz ) <(zcat IMCGM.clean.r2.fastq.gz)

/software/hifiasm-0.16.1/hifiasm  -o rsy  -t 30  -1  IMCGF.yak   -2  IMCGM.yak     rongshanyang.hifi.fa.gz
