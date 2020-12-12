library(ggplot2)
library(ggalt)
library(ggpubr)
library(cowplot)

data1<- read.table("E:/我的坚果云/Project/Mariana586/0.Mitag/0.Prepare/figS3-a-novel_mitag.txt",head = T, sep="\t")



p1<-ggscatter(data1,
          x = "cmbsf", #x变量
          y = "novel.16S.mitag.rates",#y变量
          add = "reg.line",##拟合曲线
          conf.int = TRUE,##置信区间阴影带
          cor.coef = TRUE, ##系数
          add.params = list(color = "#84C1FF",fill = "#ff7575",size=1.5),
          cor.method = "pearson",#方法
          xlab = "Water depth", ##x轴
          ylab = "Novel 16S mitags rates(%)")+scale_y_continuous(breaks=seq(0,0.5,0.05),labels=paste(seq(0,0.5,0.05)*100))+
          theme(axis.text = element_text(size=7))

p1


data2<- read.table("E:/我的坚果云/Project/Mariana586/0.Mitag/0.Prepare/figS3-b-MNS.txt",head = T, sep="\t")
data


p2<-ggscatter(data2,
          x = "cmbsf", #x变量
          #   y = "novel.16S.mitag.rates",#y变量
          y="MNS",
          add = "reg.line",##拟合曲线
          conf.int = TRUE,##置信区间阴影带
          cor.coef = TRUE, ##系数
          add.params = list(color = "#84C1FF",fill = "#ff7575",size=1.5),
          cor.method = "pearson",#方法
          xlab = "Water depth", ##x轴
          ylab = "Microbiome novelty scores")+theme(axis.text = element_text(size=7))

plot_grid(p1,p2, labels = c("a", "b"),align = "v",nrow = 1 )
