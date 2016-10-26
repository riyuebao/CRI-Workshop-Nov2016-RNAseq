#!/bin/bash



## set up environment

now=$(date +"%m-%d-%Y_%H:%M:%S")



## submit job 

bds -c /home/ubuntu/dev/rnaseq/CRI-Workshop-Nov2016-RNAseq/test/myProject/DLBC.bds.cfg  -y 0    ../Run_RNAseq.bds -aligners star -callers featurecounts -projdir /home/ubuntu/dev/rnaseq/CRI-Workshop-Nov2016-RNAseq/test/myProject -project DLBC -samples KO01 WT01 > Run_RNAseq.DLBC.$now.log.out 2> Run_RNAseq.DLBC.$now.log.err
