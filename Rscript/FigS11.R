library(ggplot2)  
library(RColorBrewer)  
library(reshape2)
library(RColorBrewer)

size(7*12)
data<- read.table("E:/我的坚果云/Project/Mariana586/3.Annotation/2.Cazymes/cazyme_filter.phylumsum",head = T,sep="\t")
group <- read.delim('E:/我的坚果云/Project/Mariana586/3.Annotation/2.Cazymes/phyla_domain.txt', sep = '\t', stringsAsFactors = FALSE)
group2 <-read.delim('F:/资料/代谢/CAZYme/CazymeClass.txt', sep = '\t', stringsAsFactors = FALSE)

mydata <- melt(data,id.vars=c("dbcan"),variable.name="Phylum",value.name="freq")
mydata <- merge(mydata, group, by = 'Phylum')
mydata <- merge(mydata, group2, by = 'dbcan')
mydata

data
ggplot(mydata, aes(x=dbcan, y=Phylum,size=freq,fill = freq)) +
  # scale_y_discrete(limits=c("Acidobacteriota","Actinobacteriota","Armatimonadota","Bacteroidota","Binatota","Chloroflexota","Dadabacteria","GCA.001730085","Gemmatimonadota","Hydrogenedentota","Krumholzibacteriota","KSB1","Latescibacterota","Marinisomatota","Myxococcota","Nitrospinota","Nitrospirota","Omnitrophota","Patescibacteria","Planctomycetota","Poribacteria","Proteobacteria","SAR324","SM23.31","Sumerlaeota","TA06","UBP7","UBP7_A","Zixibacteria","Crenarchaeota","Nanoarchaeota","Asgardarchaeota","Iainarchaeota","Halobacterota"))+ ##影响分页  
  geom_point( shape=21, colour="black",stroke=0.25,alpha=0.8) + facet_grid(domain~class ,scales="free", space="free" )+
  scale_fill_distiller(palette='RdYlBu')+
  scale_size(range = c(0.1,3)) +theme_bw()+
  theme(
    text=element_text(size=15,face="plain",color="black"),
    axis.title=element_text(size=10,face="plain",color="black"),
    axis.text.y = element_text(size=8,face="plain",color="black"),
    axis.text.x = element_text(size=9,face="plain",color="black",angle=90,hjust=1, vjust=0.5),
    legend.position="right"
  )
