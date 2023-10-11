#' Load and installs packages needed
#'
#' This function loads all necessary packages. If the
#' package is not installed, it will install it first
#' and the it will load the recently installed package
#'
#' @param data The name of the dataset you wanna call. Options = c("sau_index","dbem_coords","sau_species","dbem_species")
#' @param system If you want to override the automatic system identification
#' @return Paths to save and load data within a project
#' @export

my_data <- function(data, system = "NA"){
  
  # Error messages for misspelled variables
  Options = c("sau_index","dbem_coords","sau_species","dbem_species")
  if(!data %in% Options){
    print("Data type value not accepted. Current acceptable options:")
    print(Options)
    stop()
  }
  
  
  
  MyFunctions::my_lib(c("MyFunctions","janitor"))
  
  # Overrride automati path
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
  
  # SAU - related data
  
  if(data == "sau_index"){
    
    df_return <-  my_path("Spa","SAU", "sau_index.csv", read = TRUE) %>% 
      clean_names()
    
  }
  
  if(data == "sau_species"){
    
    df_return <- my_path("Spp", name ="exploited_species_list.csv",read = T, header = T)

  }
  
  if(data == "dbem_species"){
    
    df_return <- my_path("Spp", name ="dbem_spp_list.csv",read = T, header = T)
    
  }
  
  # DBEM - related data
  if(data == "dbem_coords"){
    
    df_return <- my_path("Spa","DBEM","Lon_Lat_DBEM.txt",read = T, header = F)
    colnames(df_return) <- c("index","lon","lat")
    
  }
  
  
  
  
  
  return(df_return)
}

# Test me
# my_path("G", "Spatial/DBEM", "Lon_Lat_DBEM.txt", read = T)

