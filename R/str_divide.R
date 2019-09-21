#' str_divide
#'
#' Ajuste inteligente del tamaño de una cadena
#'
#' Agrega saltos de línea, a una cadena, en los espacios en blanco de ésta,
#' para ajustar el un determinado ancho. Ideal para ajustar los
#' labels de las gráficas, cuando son muy largos, en más de una línea y
#' así ahorrar espacio. Esta función es "inteligente" en el sentido que divide
#' una cadena un numero de veces pero equilibrando los tamaños de las
#' subcadengas generadas
#'
#' @param str      Cadena a ajustar
#' @param by       Cantidad de veces a dividir la cadena
#' @param collapse NA para hacer unsimple split, sino el caracter para dividir
#' la cadena, por ejemplo `n`
#'
#' @return La cadena ajustada con saltos de línea o un vector de caracteres
#' @export
#'
#' @examples
#' str_divide("JUNTOS por el CAMBIO", 2)
#' str_divide("JUNTOS por el CAMBIO", 1)
#'
str_divide <- function(str, by=2, collapse="\n") {

    sp_pos <- unlist(gregexpr(" ", str))
    n_spaces <- length(sp_pos)

    if (by > n_spaces | by < 1) {
        stop('"by" debe ser un valor entre 1 y la cantidad de espacios de la cadena')
    }

    str_length <- nchar(str)
    cant_combinaciones <- choose(n_spaces,by)

    opciones <- list(n_spaces)
    opciones <- rbind(rep(0,cant_combinaciones),
                      combn(sp_pos, by),
                      rep(str_length,cant_combinaciones))

    m <- tail(opciones,-1) - head(opciones,-1) -1
    i <- which.min(apply(m,2,sd))
    x <- c(1,opciones[-1, i])
    trim <- function (x) gsub("^\\s+|\\s+$", "", x)
    words <- trim(substring(str, head(x,-1), tail(x,-1)))

    if (is.na(collapse)) {
        words
    } else {
        paste0(words, collapse=collapse)
    }

}
