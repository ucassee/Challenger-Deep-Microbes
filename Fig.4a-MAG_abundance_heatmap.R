
library(pheatmap)
library(RColorBrewer)

data = read.table("E:/我的坚果云/Project/Mariana586/1.MAG/bottom_nosz/nosz_mag_abundance.txt", header=T, row.names=1, sep="\t",check.names=F, comment.char="")

design = read.table("E:/我的坚果云/Project/Mariana586/1.MAG/abundance/row_group.txt", header=T, row.names=1, sep="\t", comment.char="")
design
anno_row = data.frame(Group = design$Position, row.names = rownames(design))
rownames(design)
rownames(data)
df <-log10(data+0.001)
df 
range(df)

df
pheatmap(df,
         scale = "none",main = "MAGs relative abundance",fontsize =18,
         gaps_row = 20 , 
         # gaps_col = c(261,413),
         show_colnames =T , show_rownames = T,border_color='Black',
         cluster_rows = FALSE, cluster_cols = FALSE,
         annotation_names_row= T,
         #  annotation_row = anno_row,
         cellwidth = 10,cellheight= 8,
         fontsize_col=6,fontsize_row=5,
         color = c(colorRampPalette(colors = c("white","#90d7ec"))(20),colorRampPalette(colors = c("#90d7ec","#ef4136"))(20)),
         legend_breaks = c(-5,-4,-3,-2,-1,0,1))
