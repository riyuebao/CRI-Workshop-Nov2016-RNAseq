##-- Set up R plot display options in notebook
options(jupyter.plot_mimetypes = "image/svg+xml") 
options(repr.plot.width = 6, repr.plot.height = 6)

##-- Plot KM
plot(surv.fit, mark=4, col=c('red','blue','green'), 
     lty=1, lwd=1.5,cex=0.8,cex.lab=0.7, cex.axis=0.7, cex.main=0.8,
     main='Kaplan-Meier survival curves for TCGA OV dataset',
     xlab='Months to Death', 
     ylab='Probability of Survival')
text(40,0.20,  labels=paste0('cluster1 (n=',sample.counts[1,2],')'), 
     cex=0.6, col='red')
text(60,0.68, labels=paste0('cluster2 (n=',sample.counts[2,2],')'), 
     cex=0.6, col='blue')
text(70,0.08, labels=paste0('cluster3 (n=',sample.counts[3,2],')'), 
     cex=0.6, col='green')

