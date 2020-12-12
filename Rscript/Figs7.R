library(ggplot2)
library(RColorBrewer)
library(SuppDists)
library(reshape2)
library(RColorBrewer)
library(Rmisc)
library(ggsignif)


data<- read.table("E:/我的坚果云/Project/Mariana586/3.Annotation/2.Cazymes/bin_cazyme_rate.txt",head = T,sep="\t")

data

data
ggplot(data,aes(x=reorder(phylum,cazyme.count),y=cazyme.count),color=phylum)+
  stat_summary(fun.y=mean,geom='bar',fun.args = list(mult=1),colour='Black',aes(fill=factor(phylum)))+
  stat_summary(fun.data = mean_sdl,fun.args = list(mult=1), geom='errorbar', color='black',width=.2) + 
  #  geom_jitter(aes(fill =phylum),position = position_jitter(0.1),shape=21, size = 3,alpha=0.3)+
  # scale_fill_manual(values=c(brewer.pal(35,"Set2")))+
  theme_classic()+
  labs( y = "CAzyme proteins count",x="Phylum")+
  theme(panel.background=element_rect(fill="white",colour="black",size=0.25),
        axis.line=element_line(colour="black",size=0.25),
        axis.title=element_text(size=13,face="plain",color="black"),
        axis.text = element_text(size=12,face="plain",color="black"),
        legend.position="none",
        axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1)
  )
