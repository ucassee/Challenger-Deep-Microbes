library(tidyverse)
library(ggpubr)
require(Hmisc)
require(corrplot)

data<- read.table("C:/Users/zhouyl/Desktop/novel_mitag_rates_line.txt",head = T,sep="\t")
data
ggscatter(data,
          x = "water_depth", #x变量
          y = "Novel.mitags.rate",#y变量
          add = "reg.line",##拟合曲线
          conf.int = TRUE,##置信区间阴影带
          cor.coef = TRUE, ##系数
          add.params = list(color = "#84C1FF",fill = "#ff7575",size=1.5),
          cor.method = "pearson",#方法
          xlab = "Water depth", ##x轴
          ylab = "Novel 16S mitags rate")##y轴
