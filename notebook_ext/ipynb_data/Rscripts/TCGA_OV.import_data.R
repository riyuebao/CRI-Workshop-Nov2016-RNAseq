##-- Set up working directory
work.dir = '.'
setwd(work.dir)

##-- Input/Output directories
in.dir = 'notebook_ext/ipynb_data/input'
out.dir = 'notebook_ext/ipynb_data/output/tcga_ov'

##-- Input/Output files
expr.file = paste0('TCGA_', cancer, '.mirna_expression.tsv')
clinical.file = paste0('TCGA_', cancer, '.clinical.tsv')

##-- Print analysis info
print(paste0('Cancer = ', cancer))
print(paste0('Expression file = ', expr.file))
print(paste0('Clinical file  = ', clinical.file))

##-- Read files
expr = read.delim(paste0(in.dir,'/',expr.file), 
                       header = T, stringsAsFactors = F)
clinical = read.delim(paste0(in.dir,'/',clinical.file), 
                           header = T, stringsAsFactors = F)

print(paste0('Patients with clincial = ', nrow(clinical)-1))
print(paste0('Patients with expression = ', ncol(expr)-1))
print(paste0('Overlap = ', length(intersect(clinical$sample, 
                                      colnames(expr)))))
clinical[1:3,]
expr[1:3,]

