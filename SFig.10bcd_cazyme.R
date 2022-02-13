library(ggplot2)
library(RColorBrewer)
library(reshape2)
library(RColorBrewer)
library(ggsignif)
require(corrplot)
library(cowplot)
library(scales)

#size(12*11)

data<- read.table("E:/我的坚果云/Project/Mariana586/3.Annotation/2.Cazymes/bin_cazyme_rate.txt",head = T,sep="\t")


data$phylum = with(data, reorder(phylum, cazyme.count,  FUN = mean))
data$phylum





data

data
p1<-ggplot(data,aes(x=phylum,y=cazyme.count),color=phylum)+
  stat_summary(fun.y=mean,geom='bar',fun.args = list(mult=1),colour='Black',aes(fill=factor(phylum)))+
  stat_summary(fun.data = mean_sdl,fun.args = list(mult=1), geom='errorbar', color='black',width=.2) + 
  geom_jitter(aes(fill =phylum), position = position_jitter(0.3),shape=21, size = 0.8,alpha=0.5)+
  #  geom_jitter(aes(fill =phylum),position = position_jitter(0.1),shape=21, size = 3,alpha=0.3)+
  # scale_fill_manual(values=c(brewer.pal(35,"Set2")))+
  theme_classic()+
  labs( y = "CAzyme proteins count",x="Phylum",size=7)+
  theme(panel.background=element_rect(fill="white",colour="black",size=0.25),
        axis.line=element_line(colour="black",size=0.25),
        axis.title=element_text(size=13,face="plain",color="black"),
        axis.text = element_text(size=12,face="plain",color="black"),
        legend.position="none",
        #        axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1),
        axis.text.x=element_blank()
  )

p1
p2<-ggplot(data,aes(x=phylum,y=cazyme.rate*100),color=phylum)+
  stat_summary(fun.y=mean,geom='bar',fun.args = list(mult=1),colour='Black',aes(fill=factor(phylum)))+
  stat_summary(fun.data = mean_sdl,fun.args = list(mult=1), geom='errorbar', color='black',width=.2) + 
  geom_jitter(aes(fill =phylum), position = position_jitter(0.3),shape=21, size = 0.8,alpha=0.5)+
  #  geom_jitter(aes(fill =phylum),position = position_jitter(0.1),shape=21, size = 3,alpha=0.3)+
  # scale_fill_manual(values=c(brewer.pal(35,"Set2")))+
  theme_classic()+
  labs( y = "Proportion of CAZYmes (%)")+
  theme(panel.background=element_rect(fill="white",colour="black",size=0.25),
        axis.line=element_line(colour="black",size=0.25),
        axis.title=element_text(size=13,face="plain",color="black"),
        axis.text = element_text(size=12,face="plain",color="black"),
        legend.position="none",
        #        axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1),
        axis.text.x=element_blank()
  )


df<- read.table("E:/我的坚果云/Project/Mariana586/3.Annotation/2.Cazymes/cazyme_phylum_class.txt",head = T,sep="\t")
data_frame<-melt(df,id.vars = c("phylum"))
data_frame


data_frame
p3<-ggplot(data_frame, aes(phylum, fill=variable, value))+
  geom_bar(stat='identity',position='fill',color ="Black")+
  #  geom_col(position='stack',width = 0.8)+
  scale_fill_manual(values=c('#B3DE69','#FDB462','#80B1D3','#FB8072','#BEBADA','#FFFFB3'))+
  scale_x_discrete(limits=c('Iainarchaeota','Thaumarchaeota','UBP7','Nanoarchaeota','Patescibacteria','UBP7_A','Asgardarchaeota','Omnitrophota','Actinobacteriota','Euryarchaeota','Chloroflexota','Binatota','Dadabacteria','Proteobacteria','Marinisomatota','Krumholzibacteriota','Zixibacteria','SAR324','Methylomirabilota','Nitrospirota','GCA-001730085','TA06','Nitrospinota','Myxococcota','Hydrogenedentota','Sumerlaeota','Acidobacteriota','Armatimonadota','Gemmatimonadota','Planctomycetota','Bacteroidota','KSB1','Latescibacterota','Poribacteria'))+
  #  scale_fill_brewer(palette="Accent")+
  scale_y_continuous(
    name = 'Proportion',
    labels = percent ) +
  theme_bw()+
  theme(panel.grid =element_blank()) +
  labs(fill = "CAZyme classes")+
  theme(axis.text.x=element_text(angle=45, hjust=1),axis.title.y = element_text(size = 18),legend.position="right")




plot_grid(p3,p1,p2, labels = c("b", "c","d"),align = "h",nrow = 3 )



