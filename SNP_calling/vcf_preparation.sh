
plink --vcf snp.autosome.ld_filter.vcf.gz --chr-set 30 --allow-extra-chr --recode 12 transpose --out plink_transpose_recode12 --threads 100
plink --vcf snp.autosome.ld_filter.vcf.gz --chr-set 30 --allow-extra-chr --recode 12 --out plink_recode12 --threads 100
plink --vcf snp.autosome.ld_filter.vcf.gz --chr-set 30 --allow-extra-chr --make-bed --out plink_makebed --threads 100

touch datapreparation_done
echo task done
