#' My personal map theme
#'
#' This function creates my own ggplot theme to 
#' standarize multiple map in one document
#'
#' @return a ggplot theme
#' @export

my_ggtheme_m <- function() {
  theme(
    plot.title = element_text(size = rel(1), hjust = 0, face = "bold"),
    panel.background = element_blank(),
    strip.background = element_blank(),
    panel.border   = element_blank(),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    axis.ticks = element_blank(),
    axis.text.x = element_text(size = 14,
                               angle = 0,
                               face = "plain"),
    axis.text.y = element_text(size = 14),
    axis.title = element_text(size = 14),
    legend.key = element_rect(colour = NA, fill = NA),
    legend.position = "top",
    legend.title = element_text(size = 16),
    legend.text = element_text(size = 14),
    strip.text.x = element_text(size = 10, colour = "black"),
    strip.text = element_text(size = 18)
  )
}