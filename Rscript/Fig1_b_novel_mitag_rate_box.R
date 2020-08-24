library(ggpubr)

data<- read.table("C:/Users/zhouyl/Desktop/mariana_mitag_rate_box.txt",head = T,sep="\t")
data
data$Group <- factor(data$Group, levels=c("Bottom", "Slope", "Mariana Water","Tara Ocean"), ordered=TRUE)
my_comparisons <- list(c("Bottom", "Slope"), c( "Bottom","Mariana Water"), c("Bottom", "Tara Ocean"))
ggviolin(data, x="Group", y="Novel.mitags.rate", fill = "Group", width = 1.5,
         ylab="Novel 16S miTag rates", xlab = "",
         palette = c("#84C1FF","#02C874","#ff7575","#FFE153"),
         add = "boxplot", add.params = list(fill="white",size = 0.3)
         # add = "jitter",add.params = list(color = "Group",alpha=0.5)
)+
  stat_compare_means(comparisons=my_comparisons, label.y = c(58, 63, 68), method = "wilcox.test")+  # Add pairwise comparisons p-value 
  stat_compare_means(label.y = 40,label.x = 3) # Add global p-value
