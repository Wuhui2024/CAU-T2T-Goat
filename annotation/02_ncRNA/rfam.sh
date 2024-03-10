set -ex

 cmscan --cpu 4 -Z 5727.84735 \
--cut_ga --rfam --nohmmonly --fmt 2 \
--clanin /databases/Rfam/14.0/Rfam.clanin \
--tblout rsy.finally.9.fasta.rfam.tsv \
/databases/Rfam/14.0/Rfam.cm rsy.9.fasta > rsy.9.fasta.cmscan
