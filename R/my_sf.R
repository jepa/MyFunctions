#' Loads a specific shapefile
#'
#' This function simply loads a shapefile. I just created it because
#' I have frquently uised sf and is annoying to be coping + pasting
#' every single time
#'
#' @param sf_name Main data repository. Currently set to HALL2000
#' @param crs
#' @param simple
#' @return the requested shapefile
#' @export

my_sf <- function(sf_name, crs = "NA", simple = "NA"){
  
  # Main path where I store my data
  if(Sys.info()[7] == "jepa"){
    Main_Path <- "/Volumes/Enterprise/Data" # jepa88 (pre-selected)
  }
  if(Sys.info()[7] == "jepa88"){
    Main_Path <- "Z:/JULIANO_NEYMAR"
  }
  if(Sys.info()[7] == "hall1000"){
    Main_Path <- "/Volumes/DATA/JULIANO_NEYMAR" #If Drobo is needed
  }
  
  root_path <- paste(Main_Path,"/Spatial/",sep="")
  
  # Error messages for misspelled variables
  Options = c("SAU","FAO")
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
  
  
  
  return(return_sf)
}
