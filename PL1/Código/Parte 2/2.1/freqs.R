#’ Frecuencia absoluta
#’
#’ Función para calcular la frecuencia absoluta.
#’
#’ @param x Un vector
#’
#’ @return Frecuencia absoluta de los elementos de x
#’ @export
#’
#’ @examples freq_abs(c(1,2,1,3))
freq_abs <- function(x)
{
	if (!is.numeric(x))
	{
		stop("x is not a numeric")
	}
	
	data <- sort(unique(x))
	counter <- vector(mode="numeric", length=0)
	for (value in data)
	{
		total <- longitud(unname(x[x == value]))
		counter <- c(counter, total)
	}
	
	setNames(counter, data)
}

#’ Frecuencia relativa
#’
#’ Función para calcular la frecuencia relativa.
#’
#’ @param x Un vector
#’
#’ @return Frecuencia relativa de los elementos de x
#’ @export
#’
#’ @examples freq_rel(c(1,2,1,3))
freq_rel <- function(x)
{
	freq_abs(x) / longitud(x)
}

#’ Frecuencia acumulada
#’
#’ Función para calcular la frecuencia acumulada.
#’
#’ @param x Un vector
#’ @param type Cadena de texto ("abs", "rel" o nada)
#’
#’ @return Frecuencia acumulada de los elementos de x
#’ @export
#’
#’ @examples freq_cum(c(1,2,1,3))
freq_cum <- function(x, type="abs")
{
	f <- list(abs = freq_abs, rel = freq_rel)
	if (type %in% names(f))
	{
		data <- f[[type]](x)
	}
	else
	{
		stop(paste("Unrecognized type:", type))
	}
	
	counter <- vector(mode="numeric", length=0)
	
	acumulator <- 0
	for (value in 1:longitud(data))
	{
		acumulator <- acumulator + data[value]
		counter <- c(counter, acumulator)
	}
	
	setNames(counter, sort(unique(x)))
}
