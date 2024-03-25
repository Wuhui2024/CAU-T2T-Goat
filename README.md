# T2T-goat1.0
We assembled a telomere-to-telomere (T2T) gap-free genome (2.86 Gb) from a cashmere goat (T2T-goat1.0), which included a Y chromosome of 20.9 Mb, using ultralong ONT and PacBio HiFi reads together with Hi-C and Bionano data.    
The scripts for T2T-goat1.0 are deposited in this website, including genome assembly, annotation, methylation, genome assessment, centromere repeat identification, etc.    
The T2T genome polish pipeline was developed combining PacBio and ONT long reads, and short reads, and it employs NextPolish, NextPolish2, and other dependencies to improve the genome quality greatly. 

## Descriptions

### Goat_polish 
#### T2T goat genome polish pipeline   
The polish pipeline was written based on WDL. It involves 8 steps of processing, including (1) k-mer generation for the following NextPolish softwares, (2) determination of low-quality regions (LQRs, mostly referring to the gaps) and high-quality regions (HQRs), (3) LQRs mapped for their chromosomal coordinates and orientations, (4) polishing LQRs by NextPolish, (5) polishing LQRs by NextPolish2, (6) polishing high coverage regions (HQRs) by NextPolish2, (7) merging LQRs and HQRs and (8) final polish for the whole genome by NextPolish2. 

#### Dependencies    
* Python 3.6+
* java 11.0+
* [Cromwell](https://github.com/broadinstitute/cromwell)    
Other dependent softwares are included in the \bin\bin directory

#### Input    
Low-quality genome fasta file to be polished is required.    
The raw data (fastq) includes all the short and long reads, such as, PacBio long reads, ONT long reads, and short reads (MGI or Illumina).

#### Usage    
1. Provide the environment paths of the required softwares in the `software.json` file.    
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
2. The running information is provided in the `run.json` file, including HiFi reads (hifi.fofn), memeory in the workstation, ONT reads (lgs.fofn), genome file to be polished (test.fa), sample name (test), short reads (sgs.fofn), cpus in the workstation (cpu).    
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
3. Run the polish workflow in the terminal.    
```
bash run.sh    
```

#### Output    
The polished genome .fa file is finally generated, with the consensus quality value (QV) of the polished genome is also provided.    

### The scripts for the goat T2T genome assembly (the directory: assembly)    
nextdenovo.sh: Preliminary assembly based on ONT reads    
run-hifiasm.sh: Assembling haploid genome contigs using HiFi reads    
hifiasm_trio.sh: Assembling haplotype genome using HiFi reads and parental short reads    
verkko.sh: Preliminary assembly based on HiFi reads and ONT reads

### The scripts for annotation (the directory: annotation)      
Repetitive element annotation, non-coding RNA annotation, gene structure prediction, and integration  

### The scripts for centoremere (the directory: centromere)      
ChIP-seq: Aligning ChIP-seq data to the reference genome and performing peak calling    
centromere_unit_identification: identifying centromere units using SRF software    
identity_heatmap: the identity heatmap of centromere units using StainedGlass
 
### The scripts for the T2T genome assessment (the directory: genome assessment)      
QV: Evaluating genome QV and completeness based on short reads    
SDs: genome segments duplications(SDs) identification and filtering    
Methylation: Calling CpG methylation sites using HiFi reads and ONT reads respectively



## Using the polish pipeline and the scripts related to the assembly and analysis of T2T-goat1.0, please consider the followed citation.    
Hui Wu, Ling-Yun Luo, Ya-Hui Zhang, Chong-Yan Zhang, Jia-Hui Huang, Dong-Xin Mo, Li-Ming Zhao, Zhi-Xin Wang, Yi-Chuan Wang, He-Hua EEr, Wen-Lin Bai, Di Han, Xing-Tang Dou, Yan-Ling Ren, Renqing Dingkao, Hai-Liang Chen, Yong Ye, Hai-Dong Du, Zhan-Qiang Zhao, Xi-Jun Wang, Shan-Gang Jia, Zhihong Liu, Meng-Hua Li.Telomere-to-telomere genome assembly of a male goat reveals novel variants associated with cashmere traits. bioRxiv, 2024.03.03.582909; doi: https://doi.org/10.1101/2024.03.03.582909
