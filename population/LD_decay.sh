
###### calculate LD decay

PopLDdecay  -InVCF  snp.autosome.finally_filter.vcf.gz  -OutStat pop.LD.stat.gz -MaxDist 300 -SubPop pop.txt


###### plot LD decay 
perl /soft/PopLDdecay-3.42/bin/Plot_MultiPop.pl -inList pop_LD.list -output all_ld

