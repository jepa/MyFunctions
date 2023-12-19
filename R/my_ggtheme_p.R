#' My personal plot theme
#'
#' This function creates my own ggplot theme to 
#' standarize multiple plots in one document
#'
#' @return a ggplot theme
#' @export

my_ggtheme_p <- function(ax_tx_s = 12,
                         axx_tx_ang = 0,
                         axy_tx_ang = 0,
                         ax_tl_s = 14, 
                         leg_pos = "top", 
                         leg_aline = 0.5, 
                         leg_tl_s = 14,
                         leg_tx_s = 12,
                         hjust = 0, 
                         facet_tx_s = 12) {
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
                               angle = axx_tx_ang,
                               hjust = hjust,
                               face = "plain",
                              color = "black"),
    axis.text.y = element_text(size = ax_tx_s,
                              color = "black"),
    axis.title = element_text(size = ax_tl_s),
    # For legend
    legend.key = element_rect(colour = NA, fill = NA),
    legend.position = leg_pos,
    legend.title.align = leg_aline,
    legend.title = element_text(size = leg_tl_s),
    legend.text = element_text(size = leg_tx_s),
    # For `facet_wrap`
    strip.text = element_text(size = facet_tx_s, colour = "black")
  )
}
