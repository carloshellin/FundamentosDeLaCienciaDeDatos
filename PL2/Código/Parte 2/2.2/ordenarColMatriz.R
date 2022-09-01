ordenarColMatriz <- function(x)
{
  for(i in 1:ncol(x))
  {
    x[,i]=x[ordenar(x[,i]),i]
  };
  x
}