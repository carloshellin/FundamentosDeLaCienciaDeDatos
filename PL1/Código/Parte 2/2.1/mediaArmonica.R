#’ Media armónica
#’
#’ Función para calcular la media armónica.
#’
#’ @param x Un vector
#’
#’ @return Media armónica de los elementos de x
#’ @export
#’
#’ @examples mediaArmonica(c(1,2,1,3))
mediaArmonica <- function(x) {1/mediaAritmetica(1/x)}