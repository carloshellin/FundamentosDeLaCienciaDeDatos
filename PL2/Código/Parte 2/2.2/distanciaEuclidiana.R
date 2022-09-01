distanciaEuclidiana <- function(punto1, punto2)
{
	acumulador <- 0

	for (i in 1:length(punto1))
	{
		acumulador <- acumulador + (punto1[i] - punto2[i]) ^ 2
	}
	
	sqrt(acumulador)
}