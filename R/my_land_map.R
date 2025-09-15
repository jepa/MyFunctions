#' My land map
#'
#' This function simply creates a land map to add to plots
#'
#' @return a ggplot land map
#' @param sacel level of map detail, options include small, medium and large
#' @export

my_land_map <- function(scale = "small",crs = 4326, fill = "grey30", color = "grey70", country_selection = NA, country_options = F){
  
  if(country_options == T ){
  
    x <- rnaturalearth::ne_countries(scale = 'small', returnclass = c("sf")) %>% 
      pull(name) %>% 
      unique()
    return(x)
  }
  
    
  if(length(country_selection) > 0){
    
    map_df <- rnaturalearth::ne_countries(scale = 'small', returnclass = c("sf")) %>% 
      st_set_crs(4326) %>% 
      st_transform(crs = crs) %>% 
      filter(name %in% country_selection) 
    
  }else{
    map_df <- rnaturalearth::ne_countries(scale = 'small', returnclass = c("sf")) %>% 
      st_set_crs(4326) %>% 
      st_transform(crs = crs)
  }
  
  map <- ggplot2::geom_sf(data = map_df,
                          aes(),
                          fill = fill,
                          color = color)
  
  return(map)
  }
  