set -ex

for i in `ls -d rsy.finally.centormere.fasta.split/*.fasta|cut -d/ -f2` 
do 

echo "

#!/bin/bash
set -ex

cd /identity/$i

export PATH=/software/anaconda3/envs/snakemake/bin/:\$PATH

/anaconda3/envs/verkko/bin/snakemake   --snakefile  /software/StainedGlass/workflow/Snakefile   --configfile  /identity/$i/conf.yaml  --keep-going    --cores 30   make_figures   --rerun-incomplete  

" > /identity/$i/snakemake_cetromere.sh
done

