library(tidyverse)
library(ggpubr)
require(Hmisc)
require(corrplot)
library(cowplot)

###size(3.8*11)  大概

data1<- read.table("E:/我的坚果云/Project/Mariana586/0.Mitag/0.Prepare/fig1b_mariana_mitag_rate_box.txt",head = T,sep="\t")
data1
data1$Group <- factor(data1$Group, levels=c("Bottom", "Slope","Deep sea", "Mariana Water"), ordered=TRUE)
p1_comparisons <- list(c("Bottom", "Slope"), c("Bottom","Deep sea"),c("Slope","Deep sea"),c( "Bottom","Mariana Water"))
p1<- ggboxplot(data1, x="Group", y="Novel.mitags.rate", fill = "Group", width = 0.5,
               xlab = "",
               palette = c("#F8766D","#00BFC4","#FEFF99","#B14A87"),
               # add = "jitter",add.params = list(color = "Group",alpha=0.5)
)+ylab(label = "Novel 16S miTags (%)")+scale_y_continuous(labels = scales::percent)+
  guides(fill=F)+scale_x_discrete(labels = c("Bottom\naxis\n(n=17)", "Slope\n(n=20)","Deep\nsed\n(n=20)","Mariana\nwater\n(n=7)","Tara\nOcean\n(n=139)"))+
  theme(axis.text = element_text(size=10,family="serif"))+
  stat_compare_means(comparisons=p1_comparisons, label.y = c( 0.48, 0.53,0.4, 0.58),  method = "wilcox.test",size=3) # Add pairwise comparisons p-value 
p1

data2<- read.table("E:/我的坚果云/Project/Mariana586/0.Mitag/0.Prepare/fig1c_mnsz_zhexian_new.txt",head = T,sep="\t")
data2$Group <- factor(data2$Group, levels=c("Bottom", "Slope"), ordered=TRUE)
p2_comparisons <- list(c("Bottom", "Slope"))
p2<-ggboxplot(data2, x="Group", y="MNS", fill = "Group",width = 0.7,
              palette = c("#F8766D","#00BFC4"),
              ylab="Microbiome novelty scores", xlab = "",
)+guides(fill=F)+
  theme(axis.text = element_text(size=10,family="serif"))+
  scale_x_discrete(labels = c("Bottom\naxis\n(n=17)", "Slope\n(n=20)"))+
  stat_compare_means(comparisons=p2_comparisons,label.y=0.25,label.x=0.5,size=3, method = "wilcox.test")  # Add pairwise comparisons p-value 
p2

data3<- read.table("E:/我的坚果云/Project/Mariana586/0.Mitag/0.Prepare/fig1d_novel_mitag_rates_line.txt",head = T,sep="\t")
p3<-ggscatter(data3,size=1.2,x = "water_depth", #x变量 
              y = "Novel.mitags.rate",#y变量
              add = "reg.line",##拟合曲线
              conf.int = TRUE,##置信区间阴影带
              cor.coef = TRUE, ##系数
              add.params = list(color = "#84C1FF",fill = "#ff7575",size=1.5),
              cor.method = "pearson",#方法
              xlab = "Water depth(m)", ##x轴
              ylab = "Novel 16S mitags (%)")+scale_y_continuous(labels=paste(seq(0.1,0.5,len=5)*100))+
  theme(axis.text = element_text(size=10,family="serif"))

p3

data4<- read.table("E:/我的坚果云/Project/Mariana586/0.Mitag/0.Prepare/fig1e_mitag_mns_line.txt",head = T,sep="\t")
p4<- ggscatter(data4,size=1.2,
               x = "water_depth", #x变量
               y = "MNS",#y变量
               add = "reg.line",##拟合曲线
               conf.int = TRUE,##置信区间阴影带
               cor.coef = TRUE, ##系数
               add.params = list(color = "#84C1FF",fill = "#ff7575",size=1.5),
               cor.method = "pearson",#方法
               xlab = "Water depth(m)", ##x轴
               ylab = "Microbiome novelty scores")+theme(axis.text = element_text(size=10,family="serif"))
p4
aligned_plots<- align_plots(p1, p3, p2, p4, align="h")
ggdraw( xlim = c(0, 1.1), ylim = c(0, 0.30))+
  draw_plot(aligned_plots[[1]], x=0,y=0,  width=0.30, height = 0.28)+
  draw_plot(aligned_plots[[2]], x=0.30,y=0, width = 0.28, height = 0.28)+ 
  draw_plot(aligned_plots[[3]], x=0.58,y=0, width = 0.15, height = 0.28)+
  draw_plot(aligned_plots[[4]], x=0.73,y=0, width = 0.28, height = 0.28)+
  draw_plot_label(label = c("b", "c","d","e"), size = 15, x=c(0, 0.30, 0.58, 0.73), y=c(0.3,0.3,0.3,0.3))

