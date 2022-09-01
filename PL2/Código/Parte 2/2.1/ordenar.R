#’ Ordenar
#’
#’ Función para ordenar de menor a mayor un vector.
#’
#’ @param x Un vector
#’
#’ @return El vector x ordenado de menor a mayor
#’ @export
#’
#’ @examples ordenar(c(1,3,4,2))
ordenar <- function(x){
	idx <- 1:longitud(x)
	for(i in 1:(longitud(x)-1))
	{
		for(j in 1:(longitud(x)-1))
		{
			if(x[j+1] <= x[j]){
				aux <- x[j+1]
				x[j+1] <- x[j]
				x[j] <- aux

				auxIdx <- idx[j+1]
				idx[j+1] <- idx[j]
				idx[j] <- auxIdx
			}

		}
	}
	return(idx)
}
