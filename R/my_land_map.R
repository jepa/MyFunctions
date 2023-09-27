#' My land map
#'
#' This function simply creates a land map to add to plots
#'
#' @return a ggplot land map
#' @param sacel level of map detail, options include small, medium and large
#' @export

my_land_map <- function(scale = "small",crs = 4326){
  
  map_df <- rnaturalearth::ne_countries(scale = 'small', returnclass = c("sf")) %>% 
    st_set_crs(4326) %>% 
    st_transform(crs = crs)
  
  map <- ggplot2::geom_sf(data = map_df)
  
  return(map)
}