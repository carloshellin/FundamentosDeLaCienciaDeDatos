#’ Mínimo
#’
#’ Función para obtener el elemento mínimo de un vector.
#’
#’ @param v Un vector
#’
#’ @return Elemento mínimo de v
#’ @export
#’
#’ @examples minimo(c(1,2,3,4))
minimo <- function(v)
{
    m <- v[1]
    if (longitud(v) == 1) return(m)
    else if (m > v[2]) return(minimo(v[-c(1)]))
    else return(minimo(v[-c(2)]))
}