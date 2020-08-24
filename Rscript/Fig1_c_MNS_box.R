library(ggpubr)

data<- read.table("C:/Users/zhouyl/Desktop/mnsz_zhexian_new.txt",head = T,sep="\t")
data
data$Group <- factor(data$Group, levels=c("Bottom", "Slope"), ordered=TRUE)
my_comparisons <- list(c("Bottom", "Slope"))
ggboxplot(data, x="Group", y="Novel.mitags.rate", fill = "Group",width = 0.4,
          palette = c("#84C1FF","#ff7575"),
          # add = "boxplot", add.params = list(fill="white",size = 0.3)
          #   add = "jitter",add.params = list(color = "Group",alpha=0.5)
)+
  stat_compare_means(method = "wilcox.test",label.y=0.26)  # Add pairwise comparisons p-value 
#  stat_compare_means(label.y = 0.3,label.x = 3) # Add global p-value
