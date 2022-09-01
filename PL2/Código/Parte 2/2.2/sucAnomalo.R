sucAnomalo <- function(x,d,k)
{
  for(i in 1:ncol(x))
  {
    if(x[k+1,i]>d)
    {
      print(i); 
      print("es un suceso anómalo o outlier")
    }	
  }
}