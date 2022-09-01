#’ Longitud
#’
#’ Función para calcular la longitud de un vector.
#’
#’ @param v Un vector
#’
#’ @return Longitud de v
#’ @export
#’
#’ @examples longitud(c(1,2,3,4))
longitud <- function(v)
{
	if(esta_vacio(unname(v))) return(0)
	else return(1 + longitud(v[-c(1)]))
}

#’ Está vacío
#’
#’ Función para saber si un vector está vacío o no.
#’
#’ @param x Un vector
#’
#’ @return Si x está vacío o no
#’ @export
#’
#’ @examples esta_vacio(c(1,2,3,4))
esta_vacio <- function(x)
{
	return(identical(x,numeric(0)) || 
	identical(x,integer(0)) || 
	identical(x,character(0)) || 
	identical(x,complex(0)) || 
	identical(x,logical(0)) || 
	is.null(x))
}
