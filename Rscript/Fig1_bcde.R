library(tidyverse)
library(ggpubr)
require(Hmisc)
require(corrplot)
library(cowplot)

data1<- read.table("C:/Users/zhouyl/Desktop/mariana_mitag_rate_box.txt",head = T,sep="\t")

data1$Group <- factor(data1$Group, levels=c("Bottom", "Slope", "Mariana Water","Tara Ocean"), ordered=TRUE)
p1_comparisons <- list(c("Bottom", "Slope"), c( "Bottom","Mariana Water"), c("Bottom", "Tara Ocean"))
p1<- ggviolin(data1, x="Group", y="Novel.mitags.rate", fill = "Group", width = 1.5,
              xlab = "",
              palette = c("#84C1FF","#02C874","#ff7575","#FFE153"),
              add = "boxplot", add.params = list(fill="white",size = 0.3)
              # add = "jitter",add.params = list(color = "Group",alpha=0.5)
)+ylab(label = "Novel 16S miTag rates(%)")+scale_y_continuous(labels=paste(seq(0,0.8,len=5)*100))+
  guides(fill=F)+scale_x_discrete(labels = c("Bottom\n(n=17)", "Slope\n(n=20)","Mariana\nwater\n(n=7)","Tara\nOcean\n(n=139)"))+
  theme(axis.text = element_text(size=10,family="serif"))+
  stat_compare_means(comparisons=p1_comparisons, label.y = c(0.57, 0.62, 0.67), method = "wilcox.test",size=3) # Add pairwise comparisons p-value 

data2<- read.table("C:/Users/zhouyl/Desktop/mnsz_zhexian_new.txt",head = T,sep="\t")
data2$Group <- factor(data2$Group, levels=c("Bottom", "Slope"), ordered=TRUE)
p2_comparisons <- list(c("Bottom", "Slope"))
p2<-ggboxplot(data2, x="Group", y="Novel.mitags.rate", fill = "Group",width = 0.7,
              palette = c("#84C1FF","#ff7575"),
              ylab="Microbiome novelty scores", xlab = "",
)+guides(fill=F)+
  theme(axis.text = element_text(size=10,family="serif"))+
  scale_x_discrete(labels = c("Bottom\n(n=17)", "Slope\n(n=20)"))+
  stat_compare_means(comparisons=p2_comparisons,label.y=0.25,label.x=0.5,size=3, method = "wilcox.test")  # Add pairwise comparisons p-value 


data3<- read.table("C:/Users/zhouyl/Desktop/novel_mitag_rates_line.txt",head = T,sep="\t")
p3<-ggscatter(data3,size=1.2,x = "water_depth", 
              y = "Novel.mitags.rate",
              add = "reg.line",
              conf.int = TRUE,
              cor.coef = TRUE, 
              add.params = list(color = "#84C1FF",fill = "#ff7575",size=1.5),
              cor.method = "pearson",
              xlab = "Water depth(m)", 
              ylab = "Novel 16S mitags rates(%)")+scale_y_continuous(labels=paste(seq(0.1,0.5,len=5)*100))+
  theme(axis.text = element_text(size=10,family="serif"))

data2<- read.table("C:/Users/zhouyl/Desktop/mitag_mns_line.txt",head = T,sep="\t")
p4<- ggscatter(data2,size=1.2,
               x = "water_depth", 
               y = "MNS",
               add = "reg.line",
               conf.int = TRUE,
               cor.coef = TRUE,
               add.params = list(color = "#84C1FF",fill = "#ff7575",size=1.5),
               cor.method = "pearson",
               xlab = "Water depth(m)", 
               ylab = "Microbiome novelty scores")+theme(axis.text = element_text(size=10,family="serif"))

aligned_plots<- align_plots(p1, p2,p3,p4, align="h")
ggdraw( xlim = c(0, 1.1), ylim = c(0, 0.30))+
  draw_plot(aligned_plots[[1]], x=0,y=0,  width=0.30, height = 0.28)+
  draw_plot(aligned_plots[[2]], x=0.30,y=0, width = 0.15, height = 0.28)+ 
  draw_plot(aligned_plots[[3]], x=0.45,y=0, width = 0.28, height = 0.28)+
  draw_plot(aligned_plots[[4]], x=0.73,y=0, width = 0.28, height = 0.28)+
  draw_plot_label(label = c("b", "c","d","e"), size = 15, x=c(0, 0.30, 0.45, 0.73), y=c(0.3,0.3,0.3,0.3))

