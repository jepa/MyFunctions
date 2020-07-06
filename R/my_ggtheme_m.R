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
    # Background
    panel.background = element_blank(),
    strip.background = element_blank(),
    panel.border   = element_blank(),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_line(colour = "white"),
    # Axis
    axis.ticks = element_blank(),
    axis.text = element_blank(),
    axis.title = element_blank(),
    # Legend 
    legend.key = element_rect(colour = NA, fill = NA),
    legend.position = "bottom",
    legend.title = element_text(size = 14),
    legend.text = element_text(size = 12),
    legend.key.width = unit(3,"line"),
    # For facets
    strip.text.x = element_text(size = 12, colour = "black"),
    strip.text = element_text(size = 16)
  )
}