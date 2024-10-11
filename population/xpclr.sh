#### calculate XP-CLR

xpclr -O ${chr}_xpclr   -F vcf -Sa Pop1.list -Sb Pop2.list -I snp.finally_filter.vcf.gz -C ${chr} -L 0.95 -P --size 50000 --step 10000
