#’ Máximo
#’
#’ Función para obtener el elemento máximo de un vector.
#’
#’ @param v Un vector
#’
#’ @return Elemento máximo de v
#’ @export
#’
#’ @examples maximo(c(1,2,3,4))
maximo <- function(v)
{
    m <- v[1]
    if (longitud(v) == 1) return(m)
    else if (m < v[2]) return(maximo(v[-c(1)]))
    else return(maximo(v[-c(2)]))
}