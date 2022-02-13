library(ggplot2)       
library(RColorBrewer)
library(reshape)
require(corrplot)
library(cowplot)

###
data<-read.csv("C:/Users/zhouyl/Desktop/TS03-LD11-3_cluster.abundance",sep="\t",na.strings="NA",stringsAsFactors=FALSE)
data
mydf <- arrange(data, desc(abundance))
mydf
mydf_top10<-mydf$cluster[1:10]
mydf_top10
mydf<-data[which(data$cluster%in% mydf_top10),]

mydf

p1<-ggplot() + geom_bar(data = mydf, aes((reorder(cluster,-abundance)),abundance*100,fill=phylum), stat = "identity")+
  theme_classic()+
  ylab("Mapping rates of reads (%)")+
  xlab("")+
  scale_fill_brewer(palette="Set2")+
#  scale_fill_manual(values=c("#5E5FC2","#C35DB7","#FF6A98","#FF9075","#FFC45F","#F9F871"))+
  # coord_flip()+
  theme(
    #text=element_text(size=15,face="plain",color="black"),
    axis.title=element_text(size=15,face="plain",color="black"),
    axis.text = element_text(size=12,face="plain",color="black"),
    legend.title=element_text(size=13,face="plain",color="black"),
    axis.text.x = element_text(angle = 45, hjust = 1, vjust =1),
    legend.position =  c(0.9,0.7)
  )
p1
###

data<-read.csv("C:/Users/zhouyl/Desktop/TS03-LD11-5_cluster.abundance",sep="\t",na.strings="NA",stringsAsFactors=FALSE)
data
mydf <- arrange(data, desc(abundance))
mydf
mydf_top10<-mydf$cluster[1:10]
mydf_top10
mydf<-data[which(data$cluster%in% mydf_top10),]

mydf

p2<-ggplot() + geom_bar(data = mydf, aes((reorder(cluster,-abundance)),abundance*100,fill=phylum), stat = "identity")+
  theme_classic()+
  ylab("Mapping rates of reads (%)")+
  xlab("")+
  scale_fill_brewer(palette="Set2")+
  # coord_flip()+
  theme(
    #text=element_text(size=15,face="plain",color="black"),
    axis.title=element_text(size=15,face="plain",color="black"),
    axis.text = element_text(size=12,face="plain",color="black"),
    legend.title=element_text(size=13,face="plain",color="black"),
    axis.text.x = element_text(angle = 45, hjust = 1, vjust =1),
    legend.position =  c(0.9,0.7)
  )
p2
###

data<-read.csv("C:/Users/zhouyl/Desktop/TS03-LD11-7_cluster.abundance",sep="\t",na.strings="NA",stringsAsFactors=FALSE)
data
mydf <- arrange(data, desc(abundance))
mydf
mydf_top10<-mydf$cluster[1:10]
mydf_top10
mydf<-data[which(data$cluster%in% mydf_top10),]

mydf

p3<-ggplot() + geom_bar(data = mydf, aes((reorder(cluster,-abundance)),abundance*100,fill=phylum), stat = "identity")+
  theme_classic()+
  ylab("Mapping rates of reads (%)")+
  xlab("Speices ranked by abundance")+
  scale_fill_brewer(palette="Set2")+
  # coord_flip()+
  theme(
    #text=element_text(size=15,face="plain",color="black"),
    axis.title=element_text(size=15,face="plain",color="black"),
    axis.text = element_text(size=12,face="plain",color="black"),
    legend.title=element_text(size=13,face="plain",color="black"),
    axis.text.x = element_text(angle = 45, hjust = 1, vjust =1),
    legend.position =  c(0.9,0.7)
  )
p3
plot_grid(p1,p2,p3, labels = c("a", "b","c"),align = "h",nrow = 3 )
