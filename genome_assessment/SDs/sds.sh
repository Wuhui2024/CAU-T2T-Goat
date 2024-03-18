set -ex



biser  -t 30   --max-error 20 --max-edit-error 10   --output  rys.tmp.sd  --temp  /SDs/tmp/  --gc-heap 3G   --kmer-size 31   rsy.finally.fasta.soft.masked

less  rys.tmp.sd |perl -ne 'chomp;@ar=split(/\t/,$_);@br=split(/;/,$ar[$#ar]);@dr=split(/\=/,$br[0]);@cr=split(/\=/,$br[1]);{;print "$_\t$dr[1]\t$cr[1]\n"}'|awk '$15<=10 && $16<=50' >  tmp1.sd

awk '$12>1000{print}' tmp1.sd > tmp2.sd

bedtools intersect -a tmp2.sd -b Satellite.bed -wa -wb -f 0.7 -v |cut -f 1-14|uniq > rsy.filter.sd
