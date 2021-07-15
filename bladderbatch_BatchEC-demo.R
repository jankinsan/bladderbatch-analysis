#loading required libraries
remotes::install_github("jankinsan/BatchEC")
library(BatchEC)
library(bladderbatch)

#setting the working directory
setwd("E:/ACADEMICS/Summer Training Docs/bladderbatch analysis/output files")

#loading data
data(bladderdata)
# Get the expression data
edata = exprs(bladderEset)
#Get the pheno data
pdata = pData(bladderEset)
batch.data<- cbind(rownames(pdata), pdata[,3])
colnames(batch.data)<- c("Samples", "batch")

#running BatchEC
beacon(expr1 = data.frame(edata),
       batch.info = batch.data,
       batch = "batch",
       NameString = "bladderbatch",
       discrete.batch = TRUE,
       clus.method = "km")

