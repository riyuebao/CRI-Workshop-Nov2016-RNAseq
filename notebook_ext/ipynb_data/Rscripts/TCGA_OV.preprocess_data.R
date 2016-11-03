##-- Preprocess row.names(clinical) = clinical[,1]
row.names(expr) = expr[,1]
expr = as.matrix(expr[,-1])

##-- median-centered normalization by gene (for NMF clustering only!)
expr.centered = t(apply(expr,1,function(x){x-median(x)}))

##-- calculate variance: MAD
expr.var = data.frame(mad = apply(expr.centered,1,mad))

##-- sort gene by MAD values (higher to lower) 
expr.var = expr.var[rev(order(expr.var[,1])),,drop=F]

print(paste0('Calcuate and sort gene by Median absolute deviation (MAD):'))
head(expr.var)

##-- select 150 most variable genes 
expr.var.top = expr.var[1:gene.top.count,,drop=F]
gene.top = data.frame(gene = row.names(expr.var.top))

print(paste0('Select top ', gene.top.count,' most variable genes'))
print(expr.var.top[1:6,,drop=F])

##-- subset expression matrix by genes and samples
expr.sub = expr.centered[row.names(expr.centered) %in% 
                              gene.top$gene,colnames(expr.centered) %in% 
                              clinical$sample]

##-- make clinical samples consistent with expression 
clinical = clinical[clinical$sample %in% 
                              colnames(expr.sub),]

##-- convert expression matrix to rank matrix (Important for NMF!)
##-- because no negative values are allowed in the matrix
expr.sub = apply(expr.sub,2,rank) / gene.top.count

print(paste0('Expression matrix ready for NMF clustering: ', 
       nrow(expr.sub), ' genes, ', 
       ncol(expr.sub), ' samples'))

