#’ Moda
#’
#’ Función para calcular la moda.
#’
#’ @param x Un vector
#’
#’ @return Moda de los elementos de x
#’ @export
#’
#’ @examples moda(c(1,2,1,3))
moda <- function(x) {as.integer(names(which.max(freq_abs(x))))}