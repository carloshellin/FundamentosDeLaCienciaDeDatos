#’ Invertir
#’
#’ Función para invertir un vector.
#’
#’ @param x Un vector
#’
#’ @return El vector x invertido
#’ @export
#’
#’ @examples invertir(c(1,2,3,4))
invertir <- function(x) 
{
	if(longitud(x) == 0) return(x)
	else return(c(invertir(x[-c(1)]),x[1]))
}
