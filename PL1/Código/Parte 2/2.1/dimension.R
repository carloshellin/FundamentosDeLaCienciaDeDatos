#’ Dimensión
#’
#’ Función para calcular dimensión de un vector.
#’
#’ @param x Un vector
#’
#’ @return Dimensión de x
#’ @export
#’
#’ @examples dimension(c(1,2,3,4))
dimension <-function(x) {return (c(nrow(x),ncol(x)))}
