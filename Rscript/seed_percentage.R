require(tidyverse)
require(ggplot2)
require(ggsci)
library(scales)

data<- read.table("C:/Users/zhouyl/Desktop/seed_sediment.stat",head = T,sep="\t")

data
data_reorder <- data %>% 
  mutate(seed_function = fct_reorder(seed_function, rate,.desc = F))
data_reorder

ggplot(data_reorder,aes(x = seed_function, y = rate,fill=area)) +
  geom_boxplot(alpha=0.7) +
  # geom_point(alpha = 0.3, position =position_jitter(width=0.3, height=0),size=1.5)+
  scale_y_continuous(name = '% of mapped metagenomic reads',labels = percent ) +
  scale_fill_manual(values = c("#F8766D", "#00BFC4"))+
  coord_flip()+
  theme_bw() +
  theme(panel.background=element_rect(fill="white",colour="black",size=0.25),
        axis.line=element_line(colour="black",size=0.25),
        axis.title=element_text(size=13,face="plain",color="black"),
        axis.text = element_text(size=10,face="plain",color="black"),
    #    axis.text.x = element_text(angle = 0, hjust = 1, vjust =1),
        #legend.position="none"
  )

