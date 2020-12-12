library(vegan)
library(ggplot2)
library(plyr)


otu <- read.delim('E:/我的坚果云/Project/Mariana586/1.MAG/abundance/MAG586_abundance_pcoa.txt', row.names = 1, sep = '\t', stringsAsFactors = F, check.names = F)
otu <- data.frame(t(otu))


group <- read.delim('F:/Project/Mariana590/abundance/MAG586group', sep = '\t', stringsAsFactors = F)

distance <- vegdist(otu, method = 'bray')
pcoa <- cmdscale(distance, k = (nrow(otu) - 1), eig = T)


ordiplot(scores(pcoa)[ ,c(1, 2)], type = 't')

summary(pcoa)


pcoa$eig
point <- data.frame(pcoa$point)


species <- wascores(pcoa$points[,1:2], otu)


write.csv(as.matrix(distance), 'distance.csv', quote = F)

write.csv(point, 'pcoa.sample.csv')

write.csv(species, 'pcoa.otu.csv')

pcoa_eig <- (pcoa$eig)[1:2] / sum(pcoa$eig)

sample_site <- data.frame({pcoa$point})[1:2]
sample_site$names <- rownames(sample_site)
names(sample_site)[1:2] <- c('PCoA1', 'PCoA2')

sample_site <- merge(sample_site, group, by = 'names', all.x = T)

write.csv(sample_site, 'sample_site.csv', quote = F)

sample_site$Site <- factor(sample_site$Site, levels = c('None-CD', 'CD'))
sample_site$high <- factor(sample_site$high, levels = c('5k', '7k', '8k', '9k', '1w'))
sample_site$Position <- factor(sample_site$Position, levels = c('North', 'South', 'axis'))
group_border <- ddply(sample_site, 'Site', function(df) df[chull(df[[2]], df[[3]]), ]) 

sample_site

pcoa_plot <- ggplot(sample_site, aes(PCoA1, PCoA2, group = Site)) +
  theme(panel.grid = element_line(color = 'gray', linetype = 2, size = 0.1), panel.background = element_rect(color = 'black', fill = 'transparent'), legend.key = element_rect(fill = 'transparent')) + #去掉背景框
  geom_vline(xintercept = 0, color = 'gray', size = 0.4) + 
  geom_hline(yintercept = 0, color = 'gray', size = 0.4) +
  geom_polygon(data = group_border, aes(fill = Site),alpha=0.1) +
  guides(fill = guide_legend(order = 1), shape = guide_legend(order = 2), color = guide_legend(order = 3)) +
  scale_shape_manual(values = c(17, 16,15,12,10)) + 
  geom_point(aes(color = Position, shape = high), size = 2.5, alpha = 0.8) + 
  
  
  labs(x = paste('PCoA axis1: ', round(100 * pcoa_eig[1], 2), '%'), y = paste('PCoA axis2: ', round(100 * pcoa_eig[2], 2), '%')) +
  annotate('text', label = 'None-CD', x = -0.31, y = -0.15, size = 5, colour = '#C673FF') +
  annotate('text', label = 'CD', x = 0.35, y = 0.05, size = 5, colour = '#FF985C')
pcoa_plot
#ggsave('PCoA.pdf', pcoa_plot, width = 6, height = 5)
ggsave('PCoA.png', pcoa_plot, width = 6, height = 5)
