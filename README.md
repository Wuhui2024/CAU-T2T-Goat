# T2T-goat1.0
Telomere-to-telomere (T2T) gap-free genome (2.86 Gb) was assembled for a cashmere goat (T2T-goat1.0), which included all autosomes and chromosomes X and Y (20.96 Mb), using MGI short reads, and ultralong ONT and PacBio HiFi long reads, together with Hi-C and Bionano data (see the citation in the end of this webpage).      
The scripts in the assembly of T2T-goat1.0, including genome assembly, annotation, methylation, genome assessment, centromere repeat identification, etc., are included here (see the pipeline below).    
   Especially, a T2T genome polish pipeline was developed in our paper, which supports flexible and multiple rounds of polishing based on PacBio, ONT, and short reads, and it employs NextPolish, NextPolish2, and other dependencies to improve the base-level quality, e.g., >50 QV score in T2T-goat1.0.
 

![Image text](https://github.com/Wuhui2024/CAU-T2T-Goat/blob/main/img_folder/pipeline-01.png)
## Descriptions

  

### The scripts for the goat T2T genome assembly (the directory: assembly)    
nextdenovo.sh: Preliminary assembly based on ONT reads    
run-hifiasm.sh: Assembling haploid genome contigs using HiFi reads    
hifiasm_trio.sh: Assembling haplotype genome using HiFi reads and parental short reads    
verkko.sh: Preliminary assembly based on HiFi reads and ONT reads

### The scripts for the goat T2T genome polish (the directory: Goat_polish)    


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
PURs: Identification and compositional analysis of PUR regions   
mapping: Reads alignment and coverage calculation      

### The scripts for the SNP calling (the directory: SNP calling)      

### The scripts for the population analysis (the directory: population)   
Population structure analysis includes PCA, ADMIXTURE, and NJ tree      
population selection analysis includes the calculation of Fst and XPCLR

### The scripts for the SV calling (the directory: long_reads_SV_calling)      
SV calling and merging.


## Using the polish pipeline and the scripts related to the assembly and analysis of T2T-goat1.0, please consider the followed citation.    
Hui Wu, Ling-Yun Luo, Ya-Hui Zhang, Chong-Yan Zhang, Jia-Hui Huang, Dong-Xin Mo, Li-Ming Zhao, Zhi-Xin Wang, Yi-Chuan Wang, He-Hua EEr, Wen-Lin Bai, Di Han, Xing-Tang Dou, Yan-Ling Ren, Renqing Dingkao, Hai-Liang Chen, Yong Ye, Hai-Dong Du, Zhan-Qiang Zhao, Xi-Jun Wang, Shan-Gang Jia, Zhihong Liu, Meng-Hua Li.Telomere-to-telomere genome assembly of a male goat reveals novel variants associated with cashmere traits. bioRxiv, 2024.03.03.582909; doi: https://doi.org/10.1101/2024.03.03.582909
