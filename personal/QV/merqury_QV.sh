set -ex
export PATH=/export/personal/software/software/merfin/v1.0/bin:$PATH
export MERQURY=/export/pipeline/BGenome/T2T/software/merqury-1.3/
export PATH=/sugon/personal1/limengyuan/software/R-3.6.0/bin/:$PATH
export R_LIBS_USER=/sugon/personal1/limengyuan/software/R-3.6.0/R_library

/export/pipeline/BGenome/T2T/software/merqury-1.3/merqury.sh  IMCG.k21.meryl  rsy.finally.fasta  rsy.finally
