#’ Es par
#’
#’ Función para saber si un número es par o no.
#’
#’ @param num Número
#’
#’ @return Si num es o no par
#’ @export
#’
#’ @examples es_par(6)
es_par <- function(num)
{
	if(num %% 2 == 0) return(1)
	else return(0)
}

#’ Mediana
#’
#’ Función para calcular la mediana.
#’
#’ @param x Un vector
#’
#’ @return Mediana de los elementos de x
#’ @export
#’
#’ @examples mediana(c(1,2,1,3))
mediana <- function(x)
{
	xOrdenado <- x[ordenar(x)]
	if(es_par(longitud(xOrdenado)))
	{
		i <- (longitud(xOrdenado)/2)
		return((xOrdenado[i] + xOrdenado[i+1])/2)
	}
	else return(xOrdenado[(longitud(xOrdenado)+1)/2])
}
