#' Loads a specific shapefile
#'
#' This function simply loads a shapefile. I just created it because
#' I have frquently uised sf and is annoying to be coping + pasting
#' every single time
#'
#' @param sf_name Name of shapefile to load. Current options FAO, SAU, MEOW, RFMO
#' @param crs The need crs of shapefile
#' @param simple if simple = NA then is fine
#' @param system If you want to override the automatic system identification.
#' @return the requested shapefile of choice
#' @export

my_sf <- function(sf_name, crs = "NA", simple = "NA", system = NA){
  
  if(is.na(system)){
    user <-  Sys.info()[7]
  }else{
    user <- system
  }
    
    
  # Main path where I store my data
  if(user == "juliano"){
    Main_Path <- "/Volumes/Enterprise/Data" # jepa88 (pre-selected)
  }
  if(user == "jepa88"){
    Main_Path <- "~/Library/CloudStorage/OneDrive-UBC/Data/"
  }
  if(user == "drobo"){
    Main_Path <- "/Volumes/DATA/JULIANO_NEYMAR" #If Drobo is needed
  }
  
  root_path <- paste(Main_Path,"/Spatial/",sep="")
  
  # Error messages for misspelled variables
  Options = c("SAU","FAO","MEOW","RFMO")
  if(!sf_name %in% Options){
    print("Data type value not accepted. Current acceptable options:")
    print(Options)
    stop()
  }
  
  
  # Get partial path for data
  if(sf_name == "FAO"){
    
    read_path <- "https://www.fao.org/fishery/geoserver/fifao/ows?service=WFS&request=GetFeature&version=1.0.0&typeName=fifao:FAO_AREAS_CWP_NOCOASTLINE"
  }
  
  if(sf_name == "SAU"){
    
    read_path <- paste0(root_path,"SAU/SAU_Shapefile/SAUEEZ_July2015.shp")
  }
  
  if(sf_name == "MEOW"){
    
    read_path <- paste0(root_path,"MEOW/meow_ecos.shp")
  }
  
  if(sf_name == "RFMO"){
    
    read_path <- paste0(root_path,"SAU/SAU_RFMO/SAU_RFMO_Sept_2015.shp")
  }
  
  # Set projection options
  
  # Do you need a specific crs?
  if(crs != "NA"){
    
    if(crs == "eck"){
      crs <- "+proj=eck4"
    }else{
      crs <- crs
    }

    return_sf <- sf::st_read(read_path) %>% 
      sf::st_transform(crs = crs)
  }else{
    return_sf <- sf::st_read(read_path)
  }
  
  # Do you want a simplified map?
  if(simple != "NA"){
    
    return_sf <- return_sf %>% 
      sf::st_simplify(preserveTopology = TRUE, dTolerance = simple)
    
  }
  
  # If no options are selected 
  # return_sf <- sf::st_read(read_path)
  
  return_sf <- return_sf %>% 
    janitor::clean_names()
  
  return(return_sf)
}
