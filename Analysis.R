#��ʼ��
library(DMwR)
library(car)

#��ȡ�����ļ�
hz_Analysis<-read.table("d:/Analysis.txt",,col.names=c('season','riverSize','waterSpeed','maxPH','minO2','avrCL','avrNO3','avrNH4','avrPO43','avrPO4','avrYLS','a1','a2','a3','a4','a5','a6','a7'),na.strings=c('XXXXXXX'))

#ժҪ
#summary(hz_Analysis)

#ֱ��ͼ
hzHistogram<-function()
{
	par(mfrow=c(2,4))
	hist(hz_Analysis$maxPH,probability=T) 
	hist(hz_Analysis$minO2,probability=T) 
	hist(hz_Analysis$avrCL,probability=T) 
	hist(hz_Analysis$avrNO3,probability=T) 
	hist(hz_Analysis$avrNH4,probability=T) 
	hist(hz_Analysis$avrPO43,probability=T) 
	hist(hz_Analysis$avrPO4,probability=T) 
	hist(hz_Analysis$avrYLS,probability=T)  
}

#qqͼ��֤��̬�ֲ�
hzQQplot<-function()
{
	par(mfrow=c(2,4))
	qqPlot(hz_Analysis$maxPH, main='QQplot of maxPH') 
	qqPlot(hz_Analysis$minO2, main='QQplot of minO2') 
	qqPlot(hz_Analysis$avrCL, main='QQplot of avrCL') 
	qqPlot(hz_Analysis$avrNO3, main='QQplot of avrNO3') 
	qqPlot(hz_Analysis$avrNH4, main='QQplot of avrNH4') 
	qqPlot(hz_Analysis$avrPO43, main='QQplot of avrPO43') 
	qqPlot(hz_Analysis$avrPO4, main='QQplot of avrPO4') 
	qqPlot(hz_Analysis$avrYLS, main='QQplot of avrYLS') 
}

#�����ĺ�ͼ
hzBoxplot<-function()
{
	par(mfrow=c(2,4))
	boxplot(hz_Analysis$maxPH,ylab="maxPH")
	boxplot(hz_Analysis$minO2,ylab="avrPO4")
	boxplot(hz_Analysis$avrCL,ylab="avrCL")
	boxplot(hz_Analysis$avrNO3,ylab="avrNO3")
	boxplot(hz_Analysis$avrNH4,ylab="avrNH4")
	boxplot(hz_Analysis$avrPO43,ylab="avrPO43")
	boxplot(hz_Analysis$avrPO4,ylab="avrPO4")
	boxplot(hz_Analysis$avrYLS,ylab="avrYLS")
}

#������ͼ
hzBwplot<-function(arg1,arg2)
{
	bwplot(arg1~arg2,data=hz_Analysis,ylab = 'Y',xlab='X'	)
}

#��ȱʧ�����޳�
#hz_Analysis[!complete.cases(hz_Analysis),]
#nrow(hz_Analysis[!complete.cases(hz_Analysis),])
#hz_Analysis <- na.omit(hz_Analysis) 

#�����Ƶ��ֵ���ȱʧֵ
#table(a)
#max(table(a))
#hz_Analysis[is.na(hz_Analysis$minO2),'minO2'] <- 9.8

#ͨ�����Ե���ع�ϵ���ȱʧ
#options(digits=1)
#cor(hz_Analysis[,4:18],use="complete.obs")
#symnum(cor(hz_Analysis[,4:18],use="complete.obs"))
#data(hz_Analysis)
#hz_Analysis<-hz_Analysis[-manyNAs(hz_Analysis),]
#lm(avrPO43~avrPO4,data=hz_Analysis)

#ͨ�����ݶ���֮������������ȱʧֵ
#hz_Analysis<-hz_Analysis[-manyNAs(hz_Analysis),]
#hz_Analysis<-knnImputation(hz_Analysis,k=10)
#hz_Analysis<-knnImputation(hz_Analysis,k=10,meth="median")