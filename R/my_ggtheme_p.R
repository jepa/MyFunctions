#' My personal plot theme
#'
#' This function creates my own ggplot theme to 
#' standarize multiple plots in one document
#'
#' @return a ggplot theme
#' @export

my_ggtheme_p <- function(ax_tx_s = 14, ax_tl_s = 15, leg_pos = "top", leg_tl_s = 16, leg_tx = 14) {
  theme(
    plot.title = element_text(size = rel(1), hjust = 0, face = "bold"),
    panel.background = element_blank(),
    strip.background = element_blank(),
    panel.border   = element_blank(),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    axis.line = element_line(color = "black"),
    axis.ticks = element_blank(),
    axis.text.x = element_text(size = ax_tx_s,
                               angle = 0,
                               face = "plain",
                              color = "black"),
    axis.text.y = element_text(size = ax_tx_s,
                              color = "black"),
    axis.title = element_text(size = ax_tl_s),
    legend.key = element_rect(colour = NA, fill = NA),
    legend.position = leg_pos,
    legend.title = element_text(size = legend_title_size),
    legend.text = element_text(size = leg_tx),
    strip.text.x = element_text(size = 10, colour = "black"),
    strip.text = element_text(size = 18)
  )
}
