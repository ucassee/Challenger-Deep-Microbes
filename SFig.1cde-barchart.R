library(ggplot2)
library(reshape2)
library(RColorBrewer)
library(ggpubr)
require(Hmisc)
require(corrplot)
library(cowplot)

###Fig S1c
df<- read.table("C:/Users/zhouyl/Desktop/arsenic.txt",head = T,sep="\t")
df

mycol= brewer.pal(n = 12, name = "Set3")

mean <- aggregate(df$Arsenic, by=list(df$Site), FUN=mean)
sd <- aggregate(df$Arsenic, by=list(df$Site), FUN=sd)
len <- aggregate(df$Arsenic, by=list(df$Site), FUN=length)
df_res <- data.frame(mean, sd=sd$x, len=len$x)
df_res
df
colnames(df_res) = c("Area", "Mean", "Sd", "Count")
str(df_res)
df_res$Se <- df_res$Sd/sqrt(df_res$Count) ### 计算标准差

p1_comparisons <- list(c("CD site", "None CD"))
p2_comparisons <- list(c("Slope", "Bottom-axis"),c("Slope", "Non-CD"))
### ggplot 绘图 (标准差：误差线)
df$Group <- factor(df$Group, levels=c( "Non-CD","Slope","Bottom-axis"), ordered=TRUE)
df

p1<-ggbarplot(df, x = "Group", y = "Arsenic", add = c("mean_sd", "jitter"),
              color = "Black", fill = "Group",xlab = "",
              palette = c("#BEBEBE","#00BFC4","#F8766D"),
              position = position_dodge(1.0))+guides(fill=F)+
  ylab(label = "Total arsenic (ug/g)") +
  scale_x_discrete(labels = c( "Non-CD\n(n=9)","Slope\n(n=11)","Bottom-axis\n(n=8)")) +
  stat_compare_means(comparisons=p2_comparisons, label.y = c(12,11), method = "wilcox.test",size=3) # Add pairwise comparisons p-value

###Fig S1d
df<- read.table("C:/Users/zhouyl/Desktop/Selenium.txt",head = T,sep="\t")
df

mycol= brewer.pal(n = 12, name = "Set3")

## 统计 3种鸢尾花形态数据数据均值、标准差、标准误
mean <- aggregate(df$Selenium, by=list(df$Site), FUN=mean)
sd <- aggregate(df$Selenium, by=list(df$Site), FUN=sd)
len <- aggregate(df$Selenium, by=list(df$Site), FUN=length)
df_res <- data.frame(mean, sd=sd$x, len=len$x)
df_res
df
colnames(df_res) = c("Area", "Mean", "Sd", "Count")
str(df_res)
df_res$Se <- df_res$Sd/sqrt(df_res$Count) ### 计算标准差

p1_comparisons <- list(c("CD site", "None CD"))
p2_comparisons <- list(c("Slope", "Bottom-axis"),c("Slope", "Non-CD"))
### ggplot 绘图 (标准差：误差线)
df$Group <- factor(df$Group, levels=c( "Non-CD","Slope","Bottom-axis"), ordered=TRUE)
df

p2<-ggbarplot(df, x = "Group", y = "Selenium", add = c("mean_sd", "jitter"),
              color = "Black", fill = "Group",xlab = "",
              palette = c("#BEBEBE","#00BFC4","#F8766D"),
              position = position_dodge(1.0))+guides(fill=F)+
  ylab(label = "Total selenium (ug/g)") +
  scale_x_discrete(labels = c( "Non-CD\n(n=8)","Slope\n(n=10)","Bottom-axis\n(n=7)")) +
  stat_compare_means(comparisons=p2_comparisons, label.y = c(0.30,0.28), method = "wilcox.test",size=3) # Add pairwise comparisons p-value

aligned_plots<- align_plots(p1, p2, align="h")
ggdraw( xlim = c(0, 0.8), ylim = c(0, 0.30))+
  draw_plot(aligned_plots[[1]], x=0,y=0,  width=0.4, height = 0.28)+
  draw_plot(aligned_plots[[2]], x=0.40,y=0, width = 0.4, height = 0.28)+ 
  draw_plot_label(label = c("c", "d"), size = 15, x=c(0, 0.40), y=c(0.3,0.3))

###Fig S1e
###size(5*3.7)
## 载入数据
df<- read.table("E:/我的坚果云/Project/Mariana586/环境因子/Rscript/Preparation/mercury.txt",head = T,sep="\t")
df

mycol= brewer.pal(n = 12, name = "Set3")

## 统计 3种鸢尾花形态数据数据均值、标准差、标准误
mean <- aggregate(df$mercury, by=list(df$Site), FUN=mean)
sd <- aggregate(df$mercury, by=list(df$Site), FUN=sd)
len <- aggregate(df$mercury, by=list(df$Site), FUN=length)
df_res <- data.frame(mean, sd=sd$x, len=len$x)
df_res
df
colnames(df_res) = c("Area", "Mean", "Sd", "Count")
str(df_res)
df_res$Se <- df_res$Sd/sqrt(df_res$Count) ### 计算标准差

p1_comparisons <- list(c("CD site", "None CD"))
p2_comparisons <- list(c("Slope", "Bottom-axis"),c("Slope", "Non-CD"))
### ggplot 绘图 (标准差：误差线)
df$Site <- factor(df$Site, levels=c( "Non-CD","Slope","Bottom-axis"), ordered=TRUE)
df

ggbarplot(df, x = "Site", y = "mercury", add = c("mean_sd", "jitter"),
          color = "Black", fill = "Site",xlab = "",
          palette = c("#BEBEBE","#00BFC4","#F8766D"),
          position = position_dodge(1.0))+guides(fill=F)+
  ylab(label = "Total arsenic (ug/g)") +
  scale_x_discrete(labels = c( "Non-CD\n(n=9)","Slope\n(n=11)","Bottom-axis\n(n=8)")) +
  stat_compare_means(comparisons=p2_comparisons, label.y = c(12,11), method = "t.test",size=3) # Add pairwise comparisons p-value

