#’ Sumatorio
#’
#’ Función para realizar un sumatorio.
#’
#’ @param v Un vector
#’ @param valorSuma Un número
#’ @param valorPotencia Un número
#’
#’ @return Sumatorio de los elementos de v con la suma de valorSuma y elevado a valorPotencia
#’ @export
#’
#’ @examples sumatorio(c(1,2,1,3))
sumatorio <- function(v, valorSuma = 0, valorPotencia = 1)
{
    if (longitud(v) == 1) return((v[1] + valorSuma)^valorPotencia)
    else return((v[1] + valorSuma)^valorPotencia + sumatorio(v[-c(1)], valorSuma, valorPotencia))
}