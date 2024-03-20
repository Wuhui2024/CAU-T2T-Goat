# Description    
## The `Goat_polish` directory includes the genome polishing pipline.  
### T2T goat genome polish     
The polish pipeline was written based on WDL. It involves 8 steps of processing, including (1) k-mer generation for the following NextPolish softwares, (2) determination of low-quality regions (LQRs, mostly referring to the gaps) and high-quality regions (HQRs), (3) LQRs mapped for their chromosomal coordinates and orientations, (4) polishing LQRs by NextPolish, (5) polishing LQRs by NextPolish2, (6) polishing high coverage regions (HQRs) by NextPolish2, (7) merging LQRs and HQRs and (8) final polish for the whole genome by NextPolish2. 
### Dependencies    
* Python 3.6+
* java 11.0+
* [Cromwell](https://github.com/broadinstitute/cromwell)    
Other dependent softwares were included in the \bin\bin directory
### Input    
Low-quality genome fasta file, PacBio long reads, ONT long reads and short reads    
### Output    
polished genome .fa file and genome QV
### Usage    
1、Input the paths of the required software in the `software.json` file    
```
{
	"yak":"/T2T_polish/version2.0/bin/bin/yak",
	"minimap2":"/T2T_polish/version2.0/bin/bin/minimap2",
	"samtools":"/T2T_polish/version2.0/bin/bin/samtools",
	"python3":"/Path/Python-3.6.3/bin/python3",
	"script":"/T2T_polish/version2.0/bin/bin/",
	"Workflow":"/T2T_polish/version2.0/bin/"
}
```   
2、Input the data file path in the `run.json`
```
{
  "nextPolish2.hifi_fofn": "/T2T_polish/version2.0/test/hifi.fofn",
  "nextPolish2.workdir": "/T2T_polish/version2.0/test/",
  "nextPolish2.memory": "60G",
  "nextPolish2.lgs_fofn": "/T2T_polish/version2.0/test/lgs.fofn",
  "nextPolish2.genome": "/Path/test.fa",
  "nextPolish2.sample": "test",
  "nextPolish2.software_json": "/T2T_polish/version2.0/test/software.json",
  "nextPolish2.sgs_fofn": "/T2T_polish/version2.0/test/sgs.fofn",
  "nextPolish2.cpu": 20
}
```    
3、Run the polish workflow    
```
bash run.sh    
```

## The `assembly` directory includes the code for nextdenovo assembly, hifasm's trio and haploid assembly, and verkko assembly.   
## The `annotation` directory includes the code for repetitive element annotation, non-coding RNA annotation, gene structure prediction, and integration.    
## The `centoremere` directory includes the code for aligning and peak calling of ChIP-seq data, identifying centromere units using SRF, and the identity graph of centromere units using StainedGlass.
## The `Hi-C_analysese` directory contains codes for Hi-C scaffolding.    
## The `Genome assessment` directory includes the code for genome QV evaluation, SD identification and filtering, as well as methylation calling based on both hifi and ont data separately.


# Citation    
Hui Wu, Ling-Yun Luo, Ya-Hui Zhang, Chong-Yan Zhang, Jia-Hui Huang, Dong-Xin Mo, Li-Ming Zhao, Zhi-Xin Wang, Yi-Chuan Wang, He-Hua EEr, Wen-Lin Bai, Di Han, Xing-Tang Dou, Yan-Ling Ren, Renqing Dingkao, Hai-Liang Chen, Yong Ye, Hai-Dong Du, Zhan-Qiang Zhao, Xi-Jun Wang, Shan-Gang Jia, Zhihong Liu, Meng-Hua Li.Telomere-to-telomere genome assembly of a male goat reveals novel variants associated with cashmere traits. bioRxiv, 2024.03.03.582909; doi: https://doi.org/10.1101/2024.03.03.582909
