library(pheatmap)

data<- read.table("E:/我的坚果云/Project/Mariana586/3.Annotation/0.Kegg/Prepare/carbon.txt",head = T,row.names=1,sep="\t")
df <- t(data[,0:35])
df
pheatmap(df,
         cluster_rows = F,
         cluster_cols = F,
         gaps_row = 5,
         #     gaps_col = c(3,5,8,13,16,19,22),
         show_rownames = TRUE,
         border_color = 'Black',
         cellwidth = 10,cellheight= 10,
         fontsize_col=8,fontsize_row=8,
         color = c("white", "#84C1FF","#005AB5"),
         breaks = c(0,0.2, 0.499, 1),  # distances 0 to 3 are red, 3 to 9 black
         main = 'Heatmap')

data<- read.table("E:/我的坚果云/Project/Mariana586/3.Annotation/0.Kegg/Prepare/nitrogen.txt",head = T,row.names=1,sep="\t")
df <- t(data[,0:35])
df
pheatmap(df,
         cluster_rows = F,
         cluster_cols = F,
         gaps_row = 5,
         #      gaps_col = c(4,7,15),
         show_rownames = TRUE,
         border_color = 'Black',
         cellwidth = 10,cellheight= 10,
         fontsize_col=8,fontsize_row=8,
         color = c("white","#CEFFCE", "#00DB00"),
         breaks = c(0,0.2, 0.499, 1),  # distances 0 to 3 are red, 3 to 9 black
         main = 'Heatmap')


data<- read.table("E:/我的坚果云/Project/Mariana586/3.Annotation/0.Kegg/Prepare/sulfur.txt",head = T,row.names=1,sep="\t")
df <- t(data[,0:35])
df
pheatmap(df,
         cluster_rows = F,
         cluster_cols = F,
         gaps_row = 5,
         #     gaps_col = c(5,7),
         show_rownames = TRUE,
         border_color = 'Black',
         cellwidth = 10,cellheight= 10,
         fontsize_col=8,fontsize_row=8,
         color = c("white", "#FFED97","#D9B300"),
         breaks = c(0,0.2, 0.499, 1),  # distances 0 to 3 are red, 3 to 9 black
         main = 'Heatmap')


data<- read.table("E:/我的坚果云/Project/Mariana586/3.Annotation/0.Kegg/Prepare/benzoate.txt",head = T,row.names=1,sep="\t")
data
df <- t(data[,0:35])
df
pheatmap(df,
         cluster_rows = F,
         cluster_cols = F,
         gaps_row = 5,
         #    gaps_col = c(3,5,11,13,15),
         border_color = 'Black',
         show_rownames = TRUE,
         cellwidth = 10,cellheight= 10,
         fontsize_col=8,fontsize_row=8,
         color = c("white","#ffaad5", "#D9006C"),
         breaks = c(0,0.2, 0.499, 1),  
         main = 'Heatmap')


data<- read.table("E:/我的坚果云/Project/Mariana586/3.Annotation/0.Kegg/Prepare/alkane.txt",head = T,row.names=1,sep="\t")
df <- t(data[,0:35])
df
pheatmap(df,
         cluster_rows = F,
         cluster_cols = F,
         gaps_row = 5,
         #       gaps_col = c(3,5,8,11,14,17),
         show_rownames = TRUE,
         border_color = 'Black',
         cellwidth = 10,cellheight= 10,
         fontsize_col=8,fontsize_row=8,
         color = c("white","#FF8F59", "#BB3D00"),
         breaks = c(0,0.2, 0.499, 1),  # distances 0 to 3 are red, 3 to 9 black
         main = 'Heatmap')

data<- read.table("E:/我的坚果云/Project/Mariana586/3.Annotation/0.Kegg/Prepare/arsenite.txt",head = T,row.names=1,sep="\t")
df <- t(data[,0:35])
df
pheatmap(df,
         cluster_rows = F,
         cluster_cols = F,
         gaps_row = 5,
         #       gaps_col = c(3,5,8,11,14,17),
         show_rownames = TRUE,
         border_color = 'Black',
         cellwidth = 10,cellheight= 10,
         fontsize_col=8,fontsize_row=8,
         color = c("white","#d3a4ff", "#6F00D2"),
         breaks = c(0,0.2, 0.499, 1),  # distances 0 to 3 are red, 3 to 9 black
         main = 'Heatmap')

data<- read.table("E:/我的坚果云/Project/Mariana586/3.Annotation/0.Kegg/Prepare/selenium.txt",head = T,row.names=1,sep="\t")
df <- t(data[,0:35])
df
pheatmap(df,
         cluster_rows = F,
         cluster_cols = F,
         gaps_row = 5,
         #       gaps_col = c(3,5,8,11,14,17),
         show_rownames = TRUE,
         border_color = 'Black',
         cellwidth = 10,cellheight= 10,
         fontsize_col=8,fontsize_row=8,
         color = c("white","#A3D1D1", "#3D7878"),
         breaks = c(0,0.2, 0.499, 1),  # distances 0 to 3 are red, 3 to 9 black
         main = 'Heatmap')
