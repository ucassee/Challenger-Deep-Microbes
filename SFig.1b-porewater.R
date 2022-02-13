library(ggplot2)
library(ggalt)
library(ggpubr)
require(corrplot)
library(cowplot)
data<- read.table("F:/桌面/20200524/nitrates",head = T, sep="\t")

p1 <- ggplot(data, aes(x=cmbsf, y=NO3, group=sample,shape=sample))+
  geom_point(aes(color=position),size =3)+
  scale_shape_manual(values = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11))+
  geom_xspline(aes(color=position),size=0.5,spline_shape =0)+
  theme_bw()+
  coord_flip()+
  scale_y_continuous(position ="right")+
  xlim(60, 0)+
  theme(panel.background=element_rect(fill="white",colour="black",size=0.25),
        axis.line=element_line(colour="black",size=0.25),
        axis.title=element_text(size=24,face="plain",color="black"),
        axis.text = element_text(size=20,face="plain",color="black"),
        axis.text.x = element_text(angle = 0, hjust = 0.5, vjust =0.5),
        legend.position="none"
  )
p1

data2<- read.table("E:/我的坚果云/Project/Mariana586/porewater/NH4.txt",head = T, sep="\t")
p2 <- ggplot(data2, aes(x=cmbsf, y=NH4, group=sample,shape=sample))+
  geom_point(aes(color=position),size =3)+
  scale_shape_manual(values = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11))+
  geom_line(aes(color=position),size=0.5)+
  theme_bw()+
  coord_flip()+
  scale_y_continuous(position ="right")+
  xlim(60, 0)+
  theme(panel.background=element_rect(fill="white",colour="black",size=0.25),
        axis.line=element_line(colour="black",size=0.25),
        axis.title=element_text(size=24,face="plain",color="black"),
        axis.text = element_text(size=20,face="plain",color="black"),
        legend.position="none"
  )
p2

data3<- read.table("E:/我的坚果云/Project/Mariana586/porewater/oxygen.txt",head = T, sep="\t")

p3 <- ggplot(data3, aes(x=cmbsf, y=oxygen, group=sample,shape=sample))+
  geom_point(aes(color=position),size =3)+
  scale_shape_manual(values = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11))+
  geom_line(aes(color=position),size=0.5)+
  theme_bw()+
  coord_flip()+
  scale_y_continuous(position ="right")+
  xlim(60, 0)+
  theme(panel.background=element_rect(fill="white",colour="black",size=0.25),
        axis.line=element_line(colour="black",size=0.25),
        axis.title=element_text(size=24,face="plain",color="black"),
        axis.text = element_text(size=20,face="plain",color="black"),
        legend.position="none"
  )
p3

plot_grid(p3,p1,p2, labels = c("a", "b","c"),align = "v",nrow = 1 )
