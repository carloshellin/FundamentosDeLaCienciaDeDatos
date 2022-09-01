kvecinos <- function(v,d,k)
{
  n = length(v)/2
  m = ordenarColMatriz(matrizDistancias(aperm(matriz(v,2,n))))
  
  sucAnomalo(m,d,k)
}