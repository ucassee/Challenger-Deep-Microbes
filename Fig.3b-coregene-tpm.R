require(tidyverse)
require(ggplot2)
require(ggsci)
library(ggalt)
library(dplyr)
library(MASS)
library(scales)
library(reshape2)
library(tibble)

###size(3*10)

data<- read.table("C:/Users/zhouyl/Desktop/MAG586_coregene_metagenome.tpm",head = T,sep="\t")
group <- read.delim('E:/我的坚果云/Project/Mariana586/3.Annotation/0.Kegg/genegroup20210821.txt', sep = '\t', stringsAsFactors = FALSE)
data
data2 <- data %>%
  group_by(kegg) %>%
  summarise(sd = sd(Abundance),tpm = mean(Abundance),min=min(Abundance),max=max(Abundance))
data2
data2$kegg = factor(data2$kegg, levels=c('K00845','K01610','K01647','K00031','K01902','K00625','K00925','K01895',
                                         'K00169','K15230','K15231','K00198','K14138','K01938','K18594','K18593',
                                         'K14534','K01601','K00855','K03320','K00605','K00261','K10944','K10535',
                                         'nxrA','narG','K00367','K02567','K00362','K03385','K00366','K00368','K04561',
                                         'K00376','K00958','K00394','K11180','K08352','K17218','K00390','K00392',
                                         'K01738','K03381','K07104','K00449','K04101','K15512','K00496','K20938',
                                         'K07755','K03893','K00537','K03741','K08356','K01042','K01008','K06917'))
data2
data2<-add_column(data2, z = c('Carbon','Carbon','Carbon','Carbon','Nitrogen','Nitrogen','Nitrogen','Nitrogen','Nitrogen','Nitrogen','Sulfur','Sulfur','Sulfur','Benzoate','Alkane','Arsenic','Nitrogen','Carbon','Carbon','Carbon','Carbon','Sulfur','Selenium','Selenium','Arsenic','Carbon','Carbon','Carbon','Sulfur','Carbon','Carbon','Nitrogen','Nitrogen','Benzoate','Nitrogen','Arsenic','Arsenic','Benzoate','Nitrogen','Selenium','Benzoate','Sulfur','Arsenic','Nitrogen','Nitrogen','Sulfur','Carbon','Carbon','Carbon','Carbon','Benzoate','Sulfur','Carbon','Carbon','Alkane','Nitrogen','Nitrogen'))
data2
mydata <- merge(data2, group, by = 'kegg')
mydata
g<-ggplot(mydata,aes(x = kegg, y = tpm, ymin = min, ymax = max,color=metabolism)) +
  geom_pointrange()+
  scale_y_continuous(trans = log10_trans(),breaks = trans_breaks("log10", function(x) 10^x),labels = trans_format("log10", math_format(10^.x)))+
  scale_color_manual(values=c("#BB3D00","#6F00D2","#D9006C","#005AB5","#00DB00","#3D7878","#D9B300"))+
  theme_bw() +
  theme(panel.background=element_rect(fill="white",colour="black",size=0.25),
        axis.line=element_line(colour="black",size=0.25),
        axis.title=element_text(size=13,face="plain",color="black"),
        axis.text = element_text(size=10,face="plain",color="black"),
        axis.text.x = element_text(angle = 60, hjust = 1, vjust =1),
        #legend.position="none"
  )
g
#ggsave(filename = "bootomkeggabundance.pdf",g,width=220,units = "mm",height=70)
