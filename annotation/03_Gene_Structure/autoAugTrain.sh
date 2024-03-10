set -ex
export PATH=/STAR/STAR-2.7.9a/bin/Linux_x86_64:$PATH
export PATH=/Samtools/samtools_v1.9/bin/:$PATH
export PATH=/Augustus/augustus-3.3.1/bin/:$PATH
export PATH=/BRAKER/BRAKER-2.1.2/scripts/:$PATH
export PATH=/Genome_Structure/v1.0/utils/:$PATH
export AUGUSTUS_CONFIG_PATH=/Augustus/augustus-3.3.1/config/

/Augustus/augustus-3.3.1/scripts/autoAugTrain.pl  --genome=rsy.fasta    --trainingset=rsy.train.gff3   --species=rsy   
