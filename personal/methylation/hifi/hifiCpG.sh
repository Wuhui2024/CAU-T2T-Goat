set -vex

#01_pbmm2
pbmm2  align  --num-threads 24 --preset CCS --sample  rsy  --log-level INFO --sort  --sort-memory 2G  --unmapped   rsy.finally.fasta   input.fofn   rsy.align.bam

#02_pb-CpG-tools
pb-CpG-tools-v2.3.1-x86_64-unknown-linux-gnu/bin/aligned_bam_to_cpg_scores  --bam  rsy.align.bam \
	 --ref   rsy.finally.fasta   --output-prefix rsy \
	 --model pb-CpG-tools-v2.3.1-x86_64-unknown-linux-gnu/models/pileup_calling_model.v1.tflite   --threads  24   --min-mapq 20
