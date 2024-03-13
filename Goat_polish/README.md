# T2T goat polish     
# Dependencies    
* Python 3.6+
* java 11.0+
* [Cromwell](https://github.com/broadinstitute/cromwell)    
Other dependent softwares were included in the \bin\bin directory

# Usage    
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
# Citation    
Hui Wu, Ling-Yun Luo, Ya-Hui Zhang, Chong-Yan Zhang, Jia-Hui Huang, Dong-Xin Mo, Li-Ming Zhao, Zhi-Xin Wang, Yi-Chuan Wang, He-Hua EEr, Wen-Lin Bai, Di Han, Xing-Tang Dou, Yan-Ling Ren, Renqing Dingkao, Hai-Liang Chen, Yong Ye, Hai-Dong Du, Zhan-Qiang Zhao, Xi-Jun Wang, Shan-Gang Jia, Zhihong Liu, Meng-Hua Li.Telomere-to-telomere genome assembly of a male goat reveals novel variants associated with cashmere traits. bioRxiv, 2024.03.03.582909; doi: https://doi.org/10.1101/2024.03.03.582909