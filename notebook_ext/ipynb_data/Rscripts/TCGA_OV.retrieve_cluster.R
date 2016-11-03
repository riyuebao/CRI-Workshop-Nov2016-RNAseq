##-- retrieve the basis matrix and coef matrix 
expr.sub.nmf.w = basis(expr.sub.nmf)
expr.sub.nmf.h = coef(expr.sub.nmf)

##-- retrieve gene cluster
expr.sub.nmf.geneclr = predict(expr.sub.nmf, 'features')
expr.sub.nmf.geneclr = data.frame(gene = row.names(expr.sub.nmf.w), 
                                  cluster = expr.sub.nmf.geneclr)
row.names(expr.sub.nmf.geneclr) = expr.sub.nmf.geneclr$gene
expr.sub.nmf.geneclr = expr.sub.nmf.geneclr[
    order(expr.sub.nmf.geneclr$cluster),]
print('Gene clusters ... ')
print(table(expr.sub.nmf.geneclr$cluster))
print(expr.sub.nmf.geneclr[1:3,])

##-- retrieve sample cluster
expr.sub.nmf.smclr = predict(expr.sub.nmf)
expr.sub.nmf.smclr = data.frame(sample = colnames(expr.sub.nmf.h), 
                                cluster = expr.sub.nmf.smclr)
row.names(expr.sub.nmf.smclr) = expr.sub.nmf.smclr$sample
expr.sub.nmf.smclr = expr.sub.nmf.smclr[
    order(expr.sub.nmf.smclr$cluster),]
print('Sample clusters ... ')
print(table(expr.sub.nmf.smclr$cluster))
print(expr.sub.nmf.smclr[1:3,])

##-- add sample cluster to clinical table
clinical = merge(clinical, expr.sub.nmf.smclr, by = 'sample')
clinical$cluster = as.numeric(clinical$cluster)
clinical = clinical[order(clinical$cluster),]