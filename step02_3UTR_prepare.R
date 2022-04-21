## clean the environment
rm(list=ls());options(stringsAsFactors=F)

#BiocManager::install("biomaRt")

library(biomaRt)
ensembl_rno <- useEnsembl(biomart = "genes", dataset = "rnorvegicus_gene_ensembl")
#listEnsembl()
#datasets <- listDatasets(ensembl_rno) #check all dataset in useEnsembl
#searchDatasets(mart = ensembl_rno, pattern = "rno") # search dataset by keyword
#listEnsemblArchives() # check the version of ensembl


#filter <- listFilters(ensembl_rno) # check the filters of query
#filter[1:5,]
#searchAttributes(mart = ensembl_rno, pattern = "Transcript stable ID")

#attributes <- listAttributes(ensembl_rno)
#attributes[1:5,]

id_list <- read.table(file = "../database/ENSRNOT")
id_list <- id_list[,1]

if (!(dir.exists(paths = "../database/3UTR"))) {
  dir.create(path = "../database/3UTR")
}
for (id in id_list) {
  threeUTR <- getBM(attributes = c("3utr","ensembl_gene_id","description","3_utr_start","3_utr_end","ensembl_transcript_id"),
                    filters = "ensembl_transcript_id",
                    values = id,
                    mart = ensembl_rno)
  if (threeUTR[1,1] != "Sequence unavailable") {
    threeUTR1 <- paste0(">",threeUTR[1,2],"|",threeUTR[1,3],"|",threeUTR[1,4],"|",threeUTR[1,5],"|",threeUTR[1,6])
    cat(threeUTR1,file = paste0("../database/3UTR/",id), append = TRUE, fill = TRUE)
    cat(threeUTR[1,1],file = paste0("../database/3UTR/",id), append = TRUE)
  }
}

