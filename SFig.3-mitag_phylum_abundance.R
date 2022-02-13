library(RColorBrewer)
library(reshape2)
library(ggplot2)
#data<- read.table("E:/Project/Mariana sediment/abundance/MAGs585_abundance.txt",head = T,row.names=1,sep="\t")
df<- read.table("E:/我的坚果云/Project/Mariana586/0.Mitag/Abundance/abundance_R.txt",head = T,sep="\t")




data_frame<-melt(df,id.vars = c("Site"))
data_frame
group <- read.delim('E:/我的坚果云/Project/Mariana586/0.Mitag/Abundance/samplegroup.txt', sep = '\t', stringsAsFactors = FALSE)
names(group)[1] <- 'Site'
group
data_frame <- merge(data_frame, group, by = 'Site')
data_frame$Site <- factor(data_frame$Site, levels = c("MC02(8-10cmbsf)","MC02(28-30cmbsf)","D1T1(0-2cmbsf)","D1T1(4-6cmbsf)","D1T2(4-6cmbsf)","D1T2(24-26cmbsf)","T1B3(0-2cmbsf)","T1B3(6-8cmbsf)","T1B5(0-2cmbsf)","T1B5(8-10cmbsf)","T1B5(28-30cmbsf)","T1B5(38-40cmbsf)","T1B8(2-4cmbsf)","T1B8(16-18cmbsf)","T1L6T1(0-3cmbsf)","T1L6T2(0-3cmbsf)","T1B10(0-2cmbsf)","T1B10(36-38cmbsf)","T1B10(44-46cmbsf)","T1B11(0-3cmbsf)","T3L11(0-3cmbsf)","T3L11(6-9cmbsf)","T3L11(12-15cmbsf)","T3L11(18-21cmbsf)","T3L8(0-3cmbsf)","T3L8(6-9cmbsf)","T3L8(12-15cmbsf)","T3L8(18-21cmbsf)","T3L14(0-2cmbsf)","T3L14(4-6cmbsf)","T3L14(6-8cmbsf)","T3L14(12-14cmbsf)","T3L14(18-20cmbsf)","T1L10(0-3cmbsf)","T1L10(6-9cmbsf)","T1L10(12-15cmbsf)","T1L10(18-21cmbsf)"))

data_frame
colors<-c("#820041","#D9006C","#FF60AF","#FFD9EC","#007500","#00A600","#00EC00","#93FF93","#DFFFDF","#5B5B00","#A6A600",
          "#FFFF37","#FFFFB9","#003D79","#0072E3","#66B3FF","#C4E1FF","#4F4F4F","#8E8E8E","#E0E0E0","#D2A2CC")


data_frame
ggplot(data_frame, aes(Site, fill=variable, value*100))+
      geom_col(position='stack',width = 0.8)+
      scale_fill_manual(values=colors)+
      facet_wrap(~area, scales = 'free_x') +
      labs( y = "Percentage (%)") +
      theme_bw()+
      theme(panel.grid =element_blank()) +
      theme(axis.text.x=element_text(angle=45, hjust=1),axis.title.y = element_text(size = 18),legend.position="top")

