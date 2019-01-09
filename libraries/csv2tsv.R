# This program transform csv2tsv
args = commandArgs(trailingOnly=TRUE)
infile_path <- args[1]
outfile_path <- args[2]
#infile_path <- c("../Data/INEGI_Mortalidad_2010/Mor2010_UTF8_imputed_zeros.csv")
#outfile_path <- c("../Data/INEGI_Mortalidad_2010/Mor2010_UTF8_imputed_zeros.tsv")
infile <- read.csv(infile_path)
rownames(infile) <- infile[,1]
infile<- infile[,-1]
write.table(infile, file=outfile_path, quote = FALSE, row.names = TRUE, col.names = TRUE,
            sep="\t")
