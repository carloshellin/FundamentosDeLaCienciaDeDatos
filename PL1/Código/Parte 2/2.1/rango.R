#’ Rango
#’
#’ Función para calcular el rango.
#’
#’ @param x Un vector
#’
#’ @return Rango de los elementos de x
#’ @export
#’
#’ @examples rango(c(1,2,1,3))
rango <- function(x)
{
    maximo(x) - minimo(x)
}