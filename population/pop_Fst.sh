###### calculate Fst between pop1 and pop2
vcftools --gzvcf snp.finally_filter.vcf.gz --weir-fst-pop pop1.list  --weir-fst-pop pop2.list --out pop1_pop2 --fst-window-size 50000 --fst-window-step 10000
