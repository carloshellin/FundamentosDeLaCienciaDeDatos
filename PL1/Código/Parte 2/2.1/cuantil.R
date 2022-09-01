#’ Es entero
#’
#’ Función para saber si un número es entero o no.
#’
#’ @param num Número
#’
#’ @return Si num es o no entero
#’ @export
#’
#’ @examples es_entero(3)
es_entero <- function(num)
{
	if(num %% 1 == 0) return(1)
	else return(0)
}

#’ Cuantil
#’
#’ Función para calcular un cuantil.
#’
#’ @param x Un vector.
#’ @param valor Número entre 0 y 1
#’
#’ @return Cuantil deseado (valor) del vector (x)
#’ @export
#’
#’ @examples cuantil(c(1,2,3,4),0.25)
cuantil <- function(x, valor)
{
	xOrdenado <- x[ordenar(x)]
	
	i <- (valor * longitud(xOrdenado))
	if(es_entero(i)) return((xOrdenado[i] + xOrdenado[i+1])/2)
	else return(xOrdenado[trunc(i)+1])
}
