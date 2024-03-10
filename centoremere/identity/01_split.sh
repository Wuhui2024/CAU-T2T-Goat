set -ex

/software/seqkit/v0.12.1/seqkit split -i rsy_v3.centormere.fasta

cd  hy_v2.centormere.fasta.split/

ls *.fasta |while read i;do samtools faidx $i;done
