#！bin/bash

set -ex

mkdir -p tmp_dir


# count high-occurrence k-mers in a HiFi or duplex assembly
/software/kmc/v3.1.1/kmc -fm -k151 -t16  -ci10  -cs1000000  rsy.finally.centormere.fasta  count.kmc  tmp_dir
/software/kmc/v3.1.1/kmc_dump  count.kmc count.txt
/software/srf-master/srf -p prefix count.txt > srf.fa

# analyze
minimap2 -c -N 1000000 -f 1000 -r 100,100 -t 20  <(/software/minimap2-2.26/k8-Linux  /software/srf-master/srfutils.js enlong  centromere.finally.fasta ) rsy.finally.fasta  > srf-aln.paf
/software/minimap2-2.26/k8-Linux  /software/srf-master/srfutils.js paf2bed  srf-aln.paf > srf-aln.bed   # filter and extract non-overlapping regions
/software/minimap2-2.26/k8-Linux	/software/srf-master/srfutils.js bed2abun srf-aln.bed > srf-aln.len  # calculate abundance of each srf contig
