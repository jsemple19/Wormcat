library(FSA)

.worm_cat_acceptable_pvalues <- function(csv_file_name) {

  acceptable_pvalues  <- read.csv(csv_file_name, row.names=1, header=TRUE, sep =",")
  acceptable_pvalues <- na.omit(acceptable_pvalues)

  acceptable_pvalues[order(acceptable_pvalues$PValue),]

  acceptable_pvalues$Bonferroni = p.adjust(acceptable_pvalues$PValue, method = "bonferroni")
  ### Acceptable is to be 0.01 on Bonferroni
  #acceptable_pvalues <- subset(acceptable_pvalues, PValue < 0.05)
  acceptable_pvalues <- subset(acceptable_pvalues, Bonferroni < 0.01)

  csv_out_file_nm <-sprintf("%s_apv.csv",substr(csv_file_name, 0, nchar(csv_file_name)-4))
  write.csv(acceptable_pvalues, file = csv_out_file_nm,row.names=FALSE)
}



