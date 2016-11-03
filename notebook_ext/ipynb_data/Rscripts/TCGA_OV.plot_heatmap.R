##-- prepare for plotting heatmaps
gene.counts = data.frame(table(expr.sub.nmf.geneclr$cluster))
gene.colors = c(rep('pink',gene.counts[1,2]),
                rep('purple',gene.counts[2,2]),
                rep('lightgreen',gene.counts[3,2]))
sample.counts = data.frame(table(expr.sub.nmf.smclr$cluster))
sample.colors = c(rep('red',sample.counts[1,2]),
                  rep('blue',sample.counts[2,2]),
                  rep('green',sample.counts[3,2]))

##-- calculate expression correlation between samples
expr.sub.srt = expr.sub[,clinical$sample]
expr.sub.srt = expr.sub.srt[row.names(expr.sub.srt) %in% 
                            expr.sub.nmf.geneclr$gene,]
expr.sub.srt = expr.sub.srt[as.character(expr.sub.nmf.geneclr$gene),]
expr.sub.cor = cor(expr.sub.srt)

##-- plot sample correlation heatmap
my.heatcol = bluered(177) 
my.breaks = sort(unique(c(seq(-1, -0.5, length.out=20),
                          seq(-0.5, 0.5, length.out=140),
                          seq(0.5, 1, length.out=20))))
centered = t(scale(t(expr.sub.cor), scale=F))
##-- skip in workshop!!
# heatmap = heatmap.2(centered, 
#                     dendrogram='none', 
#                     Rowv=NULL,
#                     Colv=NULL,
#                     col=my.heatcol, 
#                     RowSideColors=sample.colors, 
#                     ColSideColors=sample.colors, 
#                     density.info='none', 
#                     trace='none', 
#                     key=TRUE, keysize=1.2, 
#                     labRow=F,labCol=F,
#                     xlab='Samples',ylab='Samples',
#                     main = 'Sample correlation heatmap')

##-- plot gene expression heatmap
my.heatcol = bluered(177) 
centered = t(scale(t(expr.sub.srt), scale=F)) 
##-- skip in workshop!!
# heatmap = heatmap.2(centered, 
#                     dendrogram='none', 
#                     Rowv=NULL,
#                     Colv=NULL,
#                     col=my.heatcol, 
#                     RowSideColors=gene.colors, 
#                     ColSideColors=sample.colors, 
#                     density.info='none', 
#                     trace='none', 
#                     key=TRUE, keysize=1.2, 
#                     labRow=F,labCol=F,
#                     xlab='Samples',ylab='Genes',
#                     main = 'Gene expression heatmap')
