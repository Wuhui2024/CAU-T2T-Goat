
#01 satelite_cen
#sort the centromeric satellite regions (final.Sat_centr.region)
sort -k1,1 -k2,2n unsorted.Sat_centr.region >Sat_centr.region
#sort PURs (pur.region)
sort -k1,1 -k2,2n unsorted.pur.region > pur.bed
# overlapping SDs and PURs for the file (sac_pur.bed)
bedtools intersect -a pur.bed -b Sat_centr.region >sac_pur.bed
# making bed file (nosac_pur.bed) for PURs without SDs
bedtools subtract -a pur.bed -b Sat_centr.region > nosac_pur.bed


#02 SDs in PURs
# merging all files of SDs
bedtools merge -i all.sd.bed > sd.bed
# overlapping SDs and PURs
bedtools intersect -a pur.bed -b sd.bed > sd_pur.bed
# bed regions with the overlapped SDs and centromeric satellite regions
bedtools intersect -a sac_pur.bed -b sd_pur.bed >sd_sac_pur.bed 

# only centromeric satellite regions without SDs
bedtools subtract -a sac_pur.bed -b sd_sac_pur.bed > sac_nosd.bed
# only SDs without centromeric satellite regions
bedtools subtract -a sd_pur.bed -b sd_sac_pur.bed > sd_nosac.bed


#03 rDNA in PURs
# retrieving PURs without centromeric satellite regions and SDs
bedtools subtract -a nosac_pur.bed -b sd_pur.bed >nosac_sd_pur.bed
# retrieving rDNAs in PURs without centromeric satellite regions and SDs
bedtools intersect -a nosac_sd_pur.bed -b rDNA.bed > rDNA_nosa_sd.bed 


#04 Repeats by RepeatMasker
# merging all repeats by RepeatMasker
bedtools merge -i sort.repeat.bed >repeat.bed
# retrieving the PURs without centromeric satellites, SDs, and rDNA. 
bedtools subtract -a nosac_sd_pur.bed -b rDNA.bed >nosac_sd_rdna.pur.bed
# only repeats by RepeatMasker in PURs
bedtools intersect -a nosac_sd_rdna.pur.bed -b repeat.bed >repeat_pur.bed 


#05 others
bedtools subtract -a pur.bed -b Sat_centr.region >tmp1
bedtools subtract -a tmp1 -b sd_pur.bed >tmp2
bedtools subtract -a tmp2 -b rDNA.bed >tmp3
bedtools subtract -a tmp3 -b repeat.bed >final_others_pur.bed
