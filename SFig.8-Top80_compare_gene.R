library(tidyverse)
library(ggpubr)
require(Hmisc)
require(corrplot)
library(cowplot)


data<- read.table("E:/我的坚果云/Project/Mariana586/1.MAG/0.Prepare/top80_R.txt",head = T,sep="\t")
head(data,3)
data$Group <- factor(data$Group, levels=c("Trench","Bottom", "Slope"), ordered=TRUE)
p1_comparisons <- list(c("Bottom", "Trench"), c("Slope","Trench"))
p1<- ggboxplot(data, x="Group", y="Per.protein", fill = "Group", width = 0.5,
               xlab = "",
               palette = c("#F2CCC9","#FEFF99","#85C4FF","#B14A87","#B3B3B3"),
               # add = "jitter",add.params = list(color = "Group",alpha=0.5)
               )+
               ylab(label = "No. of genes per 100kb genome")+
  theme(axis.title.y = element_text(size = 8))+
  guides(fill=F)+scale_x_discrete(labels = c("Trench", "Bottom-axis","Slope")) +
  theme(axis.text = element_text(size=8,family="serif"))+
  stat_compare_means(comparisons=p1_comparisons,  method = "wilcox.test",size=3) # Add pairwise comparisons p-value 
p1

p2<- ggboxplot(data, x="Group", y="estimated.protein", fill = "Group", width = 0.5,
               xlab = "",
               palette = c("#F2CCC9","#FEFF99","#85C4FF","#B14A87","#B3B3B3"),
               # add = "jitter",add.params = list(color = "Group",alpha=0.5)
)+ylab(label = "No. of genes")+
  theme(axis.title.y = element_text(size = 8))+
  guides(fill=F)+scale_x_discrete(labels = c("Trench", "Bottom-axis","Slope")) +
  theme(axis.text = element_text(size=8,family="serif"))+
  stat_compare_means(comparisons=p1_comparisons,  method = "wilcox.test",size=3) # Add pairwise comparisons p-value 
p2

p3<- ggboxplot(data, x="Group", y="per.cazyme", fill = "Group", width = 0.5,
               xlab = "",
               palette = c("#F2CCC9","#FEFF99","#85C4FF","#B14A87","#B3B3B3"),
               # add = "jitter",add.params = list(color = "Group",alpha=0.5)
)+ylab(label = "No. of CAZyme genes per 100kb genome")+
  theme(axis.title.y = element_text(size = 8))+
  guides(fill=F)+scale_x_discrete(labels = c("Trench", "Bottom-axis","Slope")) +
  theme(axis.text = element_text(size=8,family="serif"))+
  stat_compare_means(comparisons=p1_comparisons,  method = "wilcox.test",size=3) # Add pairwise comparisons p-value 
p3

p4<- ggboxplot(data, x="Group", y="Estimated.Cazyme.number", fill = "Group", width = 0.5,
               xlab = "",
               palette = c("#F2CCC9","#FEFF99","#85C4FF","#B14A87","#B3B3B3"),
               # add = "jitter",add.params = list(color = "Group",alpha=0.5)
)+ylab(label = "No. of CAZyme genes")+
  theme(axis.title.y = element_text(size = 8))+
  guides(fill=F)+scale_x_discrete(labels = c("Trench", "Bottom-axis","Slope")) +
  theme(axis.text = element_text(size=8,family="serif"))+
  stat_compare_means(comparisons=p1_comparisons,  method = "wilcox.test",size=3) # Add pairwise comparisons p-value 
p4

p5<- ggboxplot(data, x="Group", y="permerops", fill = "Group", width = 0.5,
               xlab = "",
               palette = c("#F2CCC9","#FEFF99","#85C4FF","#B14A87","#B3B3B3"),
               # add = "jitter",add.params = list(color = "Group",alpha=0.5)
)+ylab(label = "No. of peptidases per 100kb genome")+
  theme(axis.title.y = element_text(size = 8))+
  guides(fill=F)+scale_x_discrete(labels = c("Trench", "Bottom-axis","Slope")) +
  theme(axis.text = element_text(size=10,family="serif"))+
  stat_compare_means(comparisons=p1_comparisons,  method = "t.test",size=3) # Add pairwise comparisons p-value 
p5

p6<- ggboxplot(data, x="Group", y="estimate.merops", fill = "Group", width = 0.5,
               xlab = "",
               palette = c("#F2CCC9","#FEFF99","#85C4FF","#B14A87","#B3B3B3"),
               # add = "jitter",add.params = list(color = "Group",alpha=0.5)
)+ylab(label = "No. of peptidases")+
  theme(axis.title.y = element_text(size = 8))+
  guides(fill=F)+scale_x_discrete(labels = c("Trench", "Bottom-axis","Slope")) +
  theme(axis.text = element_text(size=10,family="serif"))+
  stat_compare_means(comparisons=p1_comparisons,  method = "t.test",size=3) # Add pairwise comparisons p-value 
p6


aligned_plots<- align_plots(p1, p3,p5, align="hv")
aligned_plots2<- align_plots(p2, p4,p6, align="hv")
ggdraw( xlim = c(0, 0.9), ylim = c(0, 0.5))+
  draw_plot(aligned_plots[[1]], x=0,y=0.25,  width=0.30, height = 0.21)+
  draw_plot(aligned_plots[[2]], x=0.30,y=0.25, width = 0.3, height = 0.21)+ 
  draw_plot(aligned_plots[[3]], x=0.6,y=0.25, width = 0.3, height = 0.21)+
  draw_plot(aligned_plots2[[1]], x=0,y=0,  width=0.30, height = 0.21)+
  draw_plot(aligned_plots2[[2]], x=0.30,y=0, width = 0.3, height = 0.21)+ 
  draw_plot(aligned_plots2[[3]], x=0.6,y=0, width = 0.3, height = 0.21)+
  draw_plot_label(label = c("a","b","c","d", "e","f"), size = 15, x=c(0, 0.30, 0.6,0, 0.30, 0.6), y=c(0.5,0.5,0.5,0.22,0.22,0.22))
