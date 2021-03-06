#' Elegante theme (std)
#'
#' Es una configuración para gráficos ggplot2 que definiría como
#' "minimalista y elegante.
#'
#' @param base_size El tamaño de letra base. (por defecto 10)
#' @param base_family Tipo de letra. (por defecto, las letras default de ggplot2)
#' @param color_background El color de fondo (por defecto, "#FFFFFF" el blanco)
#'
#' @return un tema ggplot
#'
#' @examples
#' library("ggplot2")
#'
#' ggplot(mtcars, aes(x = mpg*0.43, y = wt*0.4535924, colour = factor(cyl))) +
#'   geom_point(size = 2) +
#'   labs(title = "Car weight vs efficiency",
#'        subtitle = "Using sensible metrics",
#'        x = "Efficiency (km/l)",
#'        y = "Weight (1000 kg)",
#'        colour = "Cylinders") +
#'   theme_elegante_std()
#'
#' @export
theme_elegante_std <- function(base_size = 10,
                               base_family = "",
                               color_background = "#FFFFFF"
                           )
    {
    try_require("ggplot2")

    color.background = color_background
    color.grid.major = "#D9D9D9" # Chart Gridlines
    color.axis.text = "#666666"
    color.axis.title = "#666666"
    color.title = "#666666"
    color.subtitle = "#666666"
    strip.background = '#67a9cf'

    ret <-
        ggplot2::theme_bw(base_size=base_size) +
        # Set the entire chart region to a light gray color
        ggplot2::theme(panel.background=ggplot2::element_rect(fill=color.background, color=color.background)) +
        ggplot2::theme(plot.background=ggplot2::element_rect(fill=color.background, color=color.background)) +
        ggplot2::theme(panel.border=ggplot2::element_rect(color=color.background)) +

        # Format the grid
        ggplot2::theme(panel.grid.major=ggplot2::element_line(color=color.grid.major,size=.55, linetype="dotted")) +
        ggplot2::theme(panel.grid.minor=ggplot2::element_line(color=color.grid.major,size=.55, linetype="dotted")) +
        ggplot2::theme(axis.ticks=ggplot2::element_blank()) +

        # Format the legend, but hide by default
        ggplot2::theme(legend.position="none") +
        ggplot2::theme(legend.background = ggplot2::element_rect(fill=color.background)) +
        ggplot2::theme(legend.text = ggplot2::element_text(size=base_size-3,color=color.axis.title, family = base_family)) +

        ggplot2::theme(strip.text.x = ggplot2::element_text(size=base_size, color=color.title, family = base_family, face = "bold")) +
        ggplot2::theme(strip.text.y = ggplot2::element_text(size=base_size ,color=color.title, family = base_family, face = "bold")) +
        ggplot2::theme(strip.background = ggplot2::element_rect(fill = color.background , colour = color.title, linetype=3)) +

        ggplot2::theme(plot.title=ggplot2::element_text(color=color.title,
                                                        size=base_size+10,
                                                        vjust=1.25,
                                                        family=base_family,
                                                        hjust = 0.5,
                                                        face = "bold"
                                                        )) +

        ggplot2::theme(plot.subtitle=ggplot2::element_text(color=color.subtitle, size=base_size+2, family = base_family,  hjust = 0.5,
                                                           margin=ggplot2::margin(0, 0, .5, 0, "cm")))  +

        ggplot2::theme(axis.text.x=ggplot2::element_text(size=base_size,color=color.axis.text, family = base_family)) +
        ggplot2::theme(axis.text.y=ggplot2::element_text(size=base_size,color=color.axis.text, family = base_family)) +
        ggplot2::theme(text=ggplot2::element_text(size=base_size, color=color.axis.text, family = base_family)) +

        ggplot2::theme(axis.title.x=ggplot2::element_text(size=base_size+2,color=color.axis.title, vjust=0, family = base_family)) +
        ggplot2::theme(axis.title.y=ggplot2::element_text(size=base_size+2,color=color.axis.title, vjust=1.25, family = base_family)) +
        ggplot2::theme(plot.caption=ggplot2::element_text(size=base_size-2,color=color.axis.title, vjust=1.25, family = base_family,
                                                          margin=ggplot2::margin(1, 0, -.1, 0, "cm"))) +

        # Legend
        ggplot2::theme(legend.text=ggplot2::element_text(size=base_size,color=color.axis.text, family = base_family)) +
        ggplot2::theme(legend.title=ggplot2::element_text(size=base_size,color=color.axis.text, family = base_family)) +
        ggplot2::theme(legend.key=ggplot2::element_rect(colour = color.background, fill = color.background)) +
        ggplot2::theme(legend.position="bottom",
                       legend.box = "horizontal",
                       legend.title = ggplot2::element_blank(),
                       legend.key.width = ggplot2::unit(.75, "cm"),
                       legend.key.height = ggplot2::unit(.75, "cm"),
                       legend.spacing.x = ggplot2::unit(.25, 'cm'),
                       legend.spacing.y = ggplot2::unit(.25, 'cm'),
                       legend.margin = ggplot2::margin(t=0, r=0, b=0, l=0, unit="cm")
                       ) +

        # Plot margins
        ggplot2::theme(plot.margin = ggplot2::unit(c(.5, .5, .5, .5), "cm"))

    ggplot2::update_geom_defaults("text",
                                  list(colour = color.axis.text,
                                       family = base_family)
                                  )

    ret
}

#' Elegante theme (clean)
#'
#' Es una configuración para gráficos ggplot2 que definiría como
#' "minimalista y elegante. La opción "clean" no muestra los ejes x e y, y demás
#' titulos de los ejes, ideal para gráficos como los de red.
#'
#' @param base_size El tamaño de letra base. (por defecto 10)
#' @param base_family Tipo de letra. (por defecto, las letras default de ggplot2)
#' @param color_background El color de fondo (por defecto, "#FFFFFF" el blanco)
#'
#' @return un tema ggplot
#'
#' @examples
#' library("ggplot2")
#'
#' ggplot(mtcars, aes(x = mpg*0.43, y = wt*0.4535924, colour = factor(cyl))) +
#'   geom_point(size = 2) +
#'   labs(title = "Car weight vs efficiency",
#'        subtitle = "Using sensible metrics",
#'        x = "Efficiency (km/l)",
#'        y = "Weight (1000 kg)",
#'        colour = "Cylinders") +
#'   theme_elegante_clean()
#'
#' @export
theme_elegante_clean <- function(base_size = 10,
                                 base_family = "",
                                 color_background = "#FFFFFF") {

    ret <- theme_elegante_std(base_size = base_size,
                              base_family = base_family,
                              color_background = color_background)
    ret <- ret +
        # Quitamos las grillas
        ggplot2::theme(panel.grid.major=ggplot2::element_blank()) +
        ggplot2::theme(panel.grid.minor=ggplot2::element_blank()) +
        ggplot2::theme(axis.ticks=ggplot2::element_blank()) +
        # la etiquetas del eje x
        ggplot2::theme(axis.text.x=ggplot2::element_blank()) +
        ggplot2::theme(axis.text.y=ggplot2::element_blank()) +
        # Titulos de los ejes
        ggplot2::theme(axis.title.x=ggplot2::element_blank()) +
        ggplot2::theme(axis.title.y=ggplot2::element_blank())

    ret
}
