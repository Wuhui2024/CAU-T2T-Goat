set -ex

/EVidenceModeler-1.1.1/EvmUtils/.././evidence_modeler.pl -G genome.fasta -g prediction.gff3 -w weights_all.txt -e transcript_alignments.gff3  -p protein_alignments.gff3  --exec_dir /04_Annotation/04_EVM/01_EVM/ > /04_Annotation/04_EVM/01_EVM/evm.out  
