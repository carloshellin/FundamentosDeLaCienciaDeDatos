#’ Varianza
#’
#’ Función para calcular la varianza.
#’
#’ @param v Un vector
#’
#’ @return Varianza de los elementos de x
#’ @export
#’
#’ @examples varianza(c(1,2,1,3))
varianza <- function(v)
{
    sumatorio(v, -mediaAritmetica(v), 2)/longitud(v)
}