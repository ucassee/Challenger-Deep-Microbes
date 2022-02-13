require(tidyverse)
require(ggplot2)
require(ggsci)

data<- read.table("C:/Users/zhouyl/Desktop/MAG586_coregene_metagenome.tpm",head = T,sep="\t")

data$kegg <- factor(data$kegg, levels=c('K00845','K01610','K01647','K00031','K01902','K00625','K00925','K01895',
                                        'K00169','K15230','K15231','K00198','K14138','K01938','K18594','K18593',
                                        'K14534','K01601','K00855','K03320','K00605','K00261','K10944','K10535',
                                        'nxrA','narG','K00367','K02567','K00362','K03385','K00366','K00368','K04561',
                                        'K00376','K00958','K00394','K11180','K08352','K17218','K00390','K00392',
                                        'K01738','K03381','K07104','K00449','K04101','K15512','K00496','K20938',
                                        'K07755','K03893','K00537','K03741','K08356','K01042','K01008','K06917'), ordered=TRUE)
data
data_reorder <- data %>% 
  mutate(kegg = fct_reorder(kegg, Abundance,.desc = TRUE))
data_reorder

ggplot(data,aes(x = kegg, y = Abundance,fill=area)) +
  geom_boxplot(alpha=0.7) +
  theme_bw() +
  ylab("Relative abundance (TPM)")+
  theme(panel.background=element_rect(fill="white",colour="black",size=0.25),
        axis.line=element_line(colour="black",size=0.25),
        axis.title=element_text(size=13,face="plain",color="black"),
        axis.text = element_text(size=10,face="plain",color="black"),
        axis.text.x = element_text(angle = 60, hjust = 1, vjust =1),
        #legend.position="none"
  )
