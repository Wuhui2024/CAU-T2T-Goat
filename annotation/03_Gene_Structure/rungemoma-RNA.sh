set -ex 

export PATH=/software/anaconda3/envs/annotation/bin/:$PATH

cp /software/anaconda3/pkgs/gemoma-1.9-hdfd78af_0/share/gemoma-1.9-0/GeMoMa-1.9.jar  . 
/software/anaconda3/pkgs/gemoma-1.9-hdfd78af_0/share/gemoma-1.9-0/pipeline.sh    mmseqs  rsy_v3.fasta all.gff all.fa  20 01_gemoma/  FR_UNSTRANDED Aligned.out.bam 


