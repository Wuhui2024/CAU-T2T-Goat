#!/bin/bash

set -vex 
export PATH=/software/anaconda3/envs/verkko/bin/:$PATH 
verkko  --sge   --threads 10     \
         -d  /03_Assembly/01_Preliminary/verkko   \
	--hifi  /01_Data/05_Pacbio/rongshanyang.hifi.fa.gz   \
	--nano  /01_Data/04_Nanopore/*.fastq.gz  \
	--ovs-run  8 60  60   --mer-run 4 32 60  --cns-run 8 32 40  --ovb-run  8 60  60 
