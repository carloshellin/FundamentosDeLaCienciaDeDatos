#’ Desviación Típica
#’
#’ Función para calcular la desvisción típica.
#’
#’ @param v Un vector
#’
#’ @return Desviación típica de v
#’ @export
#’
#’ @examples desTip(c(1,2,3,4))
desTip <- function(v)
{
    sqrt(sumatorio(v, -mediaAritmetica(v), 2)/longitud(v))
}
