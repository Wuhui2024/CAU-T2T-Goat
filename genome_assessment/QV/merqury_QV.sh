set -ex
export PATH=/software/merfin/v1.0/bin:$PATH
export MERQURY=/software/merqury-1.3/
export PATH=/software/R-3.6.0/bin/:$PATH
export R_LIBS_USER=/software/R-3.6.0/R_library

/software/merqury-1.3/merqury.sh  IMCG.k21.meryl  rsy.finally.fasta  rsy.finally
