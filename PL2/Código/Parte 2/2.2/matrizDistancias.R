matrizDistancias <- function(m)
{
  distancias <- c()
  numPuntos <- dim(m)[1]
  for (punto1 in 1:numPuntos)
  {
    for (punto2 in 1:numPuntos)
    {
      if (punto1 == punto2)
      {
        distancias <- append(distancias, 0)
      }
      else
      {
        distancia <- distanciaEuclidiana(m[punto1,], m[punto2,])
        distancias <- append(distancias, distancia)
      }
    }
  }
  matriz(distancias, numPuntos, numPuntos)
}