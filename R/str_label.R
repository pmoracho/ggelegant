#' **str_label**
#'
#' Agrega saltos de línea, a una cadena, en los espacios en blanco de ésta,
#' para #' ajustar el un determinado ancho. Ideal para ajustar los
#' __labels__ de las gráficas, cuando son muy largos, en más de una línea y
#' así ahorrar espacio.
#'
#' @param str    Cadena a ajustar
#' @param width  Ancho máximo en caracteres
#'
#'
#' @return La cadena ajustada con saltos de línea
#' @export
#'
#' @examples
#' str_label("Etiqueta demasiado larga", 10)
#'
str_label <- function(str, width=5) {
    paste0(strwrap(str, width=width), collapse="\n")
}
