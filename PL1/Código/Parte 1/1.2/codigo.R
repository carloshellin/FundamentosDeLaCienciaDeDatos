getOption("defaultPackages")

library(help="base")
library(help="datasets")
library(help="utils")
library(help="grDevices")
library(help="graphics")
library(help="stats")
library(help="base")
library(help="methods")
library()
library(foreign)

search() 
setRepositories()

install.packages("LearningRlab")
library("LearningRLab")

install.packages("C:/tmp/ggplot2_3.3.5.zip", repos=NULL)
install.packages("gtable")
install.packages("rlang")
install.packages("scales")
install.packages("withr")
install.packages("tibble")
library(ggplot2)
search()

getOption("defaultPackages")
install.packages("C:/tmp/arules_1.6-8.zip", repos=NULL)
library(Matrix)
library(arules)
search()

muestra<-Matrix(c(1,1,0,1,1, 1,1,1,1,0, 1,1,0,1,0, 1,0,1,1,0, 1,1,0,0,0, 0,0,0,1,0), 6, 5, byrow=TRUE, dimnames= list ( c("suceso1","suceso2","suceso3","suceso4","suceso5","suceso6"), c("Pan", "Agua", "Cafe", "Leche", "Naranjas")), sparse=TRUE)
muestra

muestrangCMatrix<-as (muestra, "nsparseMatrix")
muestrangCMatrix

transpmuestrangCMatrix<-t(muestrangCMatrix)
transpmuestrangCMatrix

transacciones<-as(transpmuestrangCMatrix, "transactions")
transacciones

summary(transacciones)

asociaciones<-apriori(transacciones, parameter=list(support=0.5, confidence=0.8))
inspect(asociaciones)