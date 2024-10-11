###### 01 winnomap2 align
winnowmap -ax asm20 -t 20  -H --MD  $ref  $qurey   > out.nocontig.sam
###### 02 bam convert paf
paftools.js sam2paf -p out.nocontig.sam > out.paf
###### 03 get Previously unresolved region
cat out.paf |awk '{if ($12 > 0) print $6"\t"$8"\t"$9}' |bedtools sort -i - |bedtools merge -i - |bedtools complement -i - -g  ${ref}.len > out.pur.region
