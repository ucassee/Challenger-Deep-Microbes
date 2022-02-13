library(ggplot2)       
library(RColorBrewer)
library(reshape)
library(pheatmap)

mydata<-read.csv("E:/我的坚果云/Project/Mariana586/7.transcriptome/coregen_tpm_heatmap_0821.txt",sep="\t",header=T, row.names=1)
mydata <-log2(mydata+1)

mydata=t(mydata)
mydata
pheatmap(mydata,
         scale = "none",main = "Transcriptional level of genes (log2(TPM+1))",fontsize =5,
         #   gaps_row = 20, 
         #  gaps_col = c(261,413),
         show_colnames =T , show_rownames = T,border_color='black',
         cluster_rows = FALSE, cluster_cols = FALSE,
         cellwidth = 10,cellheight= 10,
         fontsize_col=8,fontsize_row=8)
