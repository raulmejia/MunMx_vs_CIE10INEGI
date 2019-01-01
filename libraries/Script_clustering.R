#Cargar archivo con datos de Mortalidad y población (en segunda fila)
setwd("~/Mortalidad_INEGI/Mortalidad_completo")
data <- read.csv("Mort_Censo_2010.csv", header= TRUE, row.names = NULL)
mat <- data.matrix(data)
vec <- data[2,]
data.2 <- sweep(mat, 2, vec, `/`)

#Primer intento de mapa de calor
library("ggplot2")
library("gplots")
heatmap.2(data.2)

