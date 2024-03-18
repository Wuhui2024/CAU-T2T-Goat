set -ex

/software/nanopolish_v0.14.0/nanopolish-0.14.0/nanopolish call-methylation -t 20 -r  20220818-UNL315-P6-PAK46683-sup.pass.fastq.gz  -b  20220818-UNL315-P6-PAK46683-sup.pass.fastq.gz.sort.bam  -g  rsy.finally.fasta > 20220818-UNL315-P6-PAK46683-sup.methylation_calls.tsv 
