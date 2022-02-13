library(RColorBrewer)
library(reshape2)
library(ggplot2)

#data<- read.table("E:/Project/Mariana sediment/abundance/MAGs585_abundance.txt",head = T,row.names=1,sep="\t")
df<- read.table("E:/我的坚果云/Project/Mariana586/0.Mitag/Abundance/18S_abundance_merge_site.txt",head = T,sep="\t")
df

data_frame<-melt(df,id.vars = c("Site"))

data_frame$Site <- factor(data_frame$Site, levels = c("5400m","7143m","10900m"))

colors<-c("#820041","#D9006C","#FF60AF","#FFD9EC","#007500","#00A600","#00EC00","#93FF93","#DFFFDF","#5B5B00","#A6A600",
          "#FFFF37","#FFFFB9","#003D79","#0072E3","#66B3FF","#C4E1FF","#4F4F4F","#8E8E8E","#E0E0E0","#D2A2CC","#842B00",
          "#F75000","#FF9D6F","#FFE6D9","#FFD2D2","#3D7878","#C4E1E1","#600000","#CE0000","#FF5151")


data_frame
ggplot(data_frame, aes(Site, fill=variable, value*100))+
  geom_col(position='stack',width = 0.8)+
  scale_fill_manual(values=colors)+
  labs( y = "Percentage (%)") +
  theme_bw()+
  theme(panel.grid =element_blank()) +
  theme(axis.text.x=element_text(angle=45, hjust=1),axis.title.y = element_text(size = 18),legend.position="right")
