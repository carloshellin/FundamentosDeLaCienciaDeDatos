#’ Media geométrica
#’
#’ Función para calcular la media geométrica.
#’
#’ @param x Un vector
#’
#’ @return Media geométrica de los elementos de x
#’ @export
#’
#’ @examples mediaGeometrica(c(1,2,1,3))
mediaGeometrica <- function(x) {prod(x)^(1/longitud(x))}