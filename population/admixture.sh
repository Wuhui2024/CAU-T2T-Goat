###### calculate admixture
for i in {1..10}
do

echo "
admixture -j100 --cv plink_recode12.ped ${i} | tee log${i}.out
cut -f 1 -d ' ' plink_recode12.ped |paste - plink_recode12.${i}.Q >addsample.${i}.Q
perl /soft/StrucutreGroup.pl addsample.${i}.Q >grouping.${i}.Q
sed -i '/^$/d' grouping.${i}.Q
cut -f 1 -d ' ' grouping.${i}.Q > k${i}.samplelist
echo -e 'library(\"RColorBrewer\")
mypalette<-brewer.pal(12,\"Paired\")
outfilename=paste(\"k\",\"${i}\",\".pdf\",sep=\"\")
pdf(outfilename,width=50, height=10)
file<-paste(\"grouping.\",\"${i}\",\".Q\",sep=\"\")
data<-read.table(file,head=F)
name<-data[,1]
data<-data[,-1]
rownames(data)<-name
data<-t(data)
barplot(as.matrix(data),col=mypalette,axisnames=FALSE,cex.axis=0.8,space =0,border = NA)
axis(1,at=seq(0.5,length(name)-0.5,1),labels=colnames(data),col=\"white\",las=2,cex.axis=0.25)
knum<-paste(\"k=\",\"${i}\",sep=\"\")
mtext(knum,side=4)' >> admixturefigure.${i}.R
if [ ${i} -ge 2 ]
then
/R4.2.2/bin/Rscript admixturefigure.${i}.R
fi
		
touch admixture_0${i}_done
echo task done
date" > admixture_${i}.sh
done

###### best K value
grep -h CV log*out|sed -e 's/CV error (K=//g' -e 's/)://g'|sort -k1,1n >CV.data
echo -e 'CV=read.table("CV.data",head=F)
pdf("BestK.pdf")
plot(CV,xlab="K",ylab="CV error",bty="n",type="l")' >>OptimalK.R
/R4.2.2/bin/Rscript OptimalK.R
