# Loading required libraries
source("libraries/plot_raw_Matrix_png.R")

#-- Data changed by the user 
mymat_path <- c("../Data/INEGI_Mortalidad_2010/Mortalidad_2010_completo.csv.UTF8")
# mymat_path <- c("../Data/INEGI_Mortalidad_2010/Mortalidad_2010_completo.UTF8.tsv")
title_heatmap<- c("Death cause in mexican municipalities")
results_path <- c("/media/rmejia/ADATA-HD710/boba-bk-postsismo/rmejia/Documents/Otros_Proyectos_academicos/Municipios_CIE10_vs_MunMex/Results/")
file_name <- paste0( results_path,"Heatmap_and_Dendro_absolute_deaths_vs_Municipalities_including_States.png"  )
# don't forget change the column_colors

#-- Loading data
mymat <- read.csv(file=mymat_path )
#mymat <- read.table(file=mymat_path, quote="", header=TRUE, sep="\t", stringsAsFactors=FALSE )
dim(mymat)
class(mymat)

is.na[mymat]

mymat<- as.data.frame(mymat)
class[mymat]
str(mymat)
dim[mymat]
mymat[1:16,1:6]
column_colors <- rep("green",dim(mymat)[2])

#-- Cleaning the data
mymat == NA 


#-- Invoking the function

plot_raw_Matrix_png(mymat, title_heatmap,file_name , column_colors)


