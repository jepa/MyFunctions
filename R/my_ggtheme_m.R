#' My personal map theme
#'
#' This function creates my own ggplot theme to 
#' standarize multiple map in one document
#'
#' @return a ggplot theme
#' @export

my_ggtheme_m <- function(map_type = "global",ax_tx_s = 14, axx_tx_ang = 0,axy_tx_ang = 0, ax_tl_s = 15, leg_pos, leg_tl_s = 16, leg_tx_s = 14,hjust = 0, facet_tx_s = 10){
  
  if(map_type == "global"){
    
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
      legend.position = leg_pos,
      legend.title = element_text(size = 12),
      legend.text = element_text(size = 11),
      legend.key.width = unit(3,"line"),
      # For facets
      strip.text.x = element_text(size = 12, colour = "black"),
      strip.text = element_text(size = 11)
    )
    
  }else{
    
    theme(
      plot.title = element_text(size = rel(1), hjust = 0, face = "bold"),
      # Background
      panel.background = element_blank(),
      strip.background = element_blank(),
      panel.border   = element_blank(),
      panel.grid.minor = element_blank(),
      panel.grid.major = element_line(colour = "white"),
      # Axis
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
      # Legend 
      legend.key = element_rect(colour = NA, fill = NA),
      legend.position = leg_pos,
      legend.title = element_text(size = 12),
      legend.text = element_text(size = 11),
      # legend.key.width = unit(2,"line"),
      # For facets
      strip.text.x = element_text(size = 12, colour = "black"),
      strip.text = element_text(size = 11)
    )
    
  }
}
