% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme_elegante.R
\name{theme_elegante_std}
\alias{theme_elegante_std}
\title{Elegante theme (std)}
\usage{
theme_elegante_std(
  base_size = 10,
  base_family = "",
  color_background = "#FFFFFF"
)
}
\arguments{
\item{base_size}{El tamaño de letra base. (por defecto 10)}

\item{base_family}{Tipo de letra. (por defecto, las letras default de ggplot2)}

\item{color_background}{El color de fondo (por defecto, "#FFFFFF" el blanco)}
}
\value{
un tema ggplot
}
\description{
Es una configuración para gráficos ggplot2 que definiría como
"minimalista y elegante.
}
\examples{
library("ggplot2")

ggplot(mtcars, aes(x = mpg*0.43, y = wt*0.4535924, colour = factor(cyl))) +
  geom_point(size = 2) +
  labs(title = "Car weight vs efficiency",
       subtitle = "Using sensible metrics",
       x = "Efficiency (km/l)",
       y = "Weight (1000 kg)",
       colour = "Cylinders") +
  theme_elegante_std()

}
