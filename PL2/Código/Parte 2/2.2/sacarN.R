sacarN <- function(x,K)
{
  if((K+2) > nrow(x)) (nrow(x) - 1) 
  else
  {
    N <- K
    for(j in 1:ncol(x))
    {
      ultdist <- x[(K+1),j]
      cont <- K
      for(i in (K+2):nrow(x))
      {
        if(round(ultdist,2) == round(x[i,j],2)) cont = cont + 1
        else break;
      }
      N <- max(N,cont)
    }
    N
  }
}