library(ggplot2)


data<- read.table("E:/我的坚果云/Project/Mariana586/3.Annotation/2.Cazymes/Cazy_count.txt",head = T,sep="\t")

data$category <- factor(data$category,levels=c("PL", "CBM", "AA","CE", "GH", "GT"), ordered=TRUE)


ggplot(data,aes(x=category,y=count,fill=category))+
  geom_boxplot(outlier.size=0.5)+
  #geom_jitter(color="black",size=0.3,alpha=0.5)+
  theme(panel.background=element_rect(fill="white",colour="black",size=0.25),
        axis.line=element_line(colour="black",size=0.25),
        axis.title=element_text(size=13,face="plain",color="black"),
        axis.text = element_text(size=10,face="plain",color="black"),
        axis.text.x = element_text(angle = 0, hjust = 0.5, vjust =0),
        legend.position="none")
