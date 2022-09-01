#’ Media aritmética
#’
#’ Función para calcular la media aritmética.
#’
#’ @param x Un vector
#’
#’ @return Media aritmética de los elementos de x
#’ @export
#’
#’ @examples mediaAritmetica(c(1,2,1,3))
mediaAritmetica <- function(x) {sumatorio(x)/longitud(x)}