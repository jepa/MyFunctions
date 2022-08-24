#' Load and installs packages needed
#'
#' This function loads all necessary packages. If the
#' package is not installed, it will install it first
#' and the it will load the recently installed package
#'
#' @param path_type Type of path needed "D" for Data, "R", for Result and "G" for generic. You need those paths to be load in the global environment
#' @param project I normally call my data folder the same as the project so it automatically sets to the project name. Alternatives available.
#' @param extra_path Any sub-path to add WITHIN the folders. Note, if it is before, include it on the "Folder" parameter -e.g. project/SubFolder -
#' @param name Dataset name in case you want the option to load data
#' @param repo Normally set to jepa88 but if connection to Drobo is available use repo = "FALSE"
#' @param read Default read = FALSE. read = FALSE will only return a path wile read = TURE will read a dataset
#' @param system If you want to override the automatic system identification
#' @return Paths to save and load data within a project
#' @export
my_path <- function(path_type, extra_path= "", name = "", repo = TRUE, read=FALSE, header=TRUE, project = TRUE, system = NA){
  
  # Overrride automati path
  if(is.na(system)){
    user <-  Sys.info()[7]
  }else{
    user <- system
  }
  
  # Main path where I store my data
  if(user== "jepa"){
    Main_Path <- "/Volumes/Enterprise/Data" # jepa88 (pre-selected)
    }
    if(user == "jepa88"){
      Main_Path <- "Z:/JULIANO_NEYMAR"
    }
  if(user == "juliano"){
      Main_Path <- "/Volumes/DATA/JULIANO_NEYMAR" #If Drobo is needed
    }
  
  # Automatically sets the project name
  if(project == TRUE){
    
    # Get projecet name (only working for carmelia right now)
    Project_root <- rprojroot::find_rstudio_root_file()
    Project <- sub("^.*([^/]*/[^/]*)", "\\1", Project_root)
    
  }
  
  # Set project Data, Generic Data, Results and Figures paths
  if(path_type %in% c("R","r","Result","result")){
    Path <- paste(Main_Path,Project,"/Results",sep="")
  }
  if(path_type %in% c("D","Data","d","data")){
    Path <- paste(Main_Path,Project,"/Data",sep="")
  }
  if(path_type%in% c("G","Generic","g","generic")){
    Path <- Main_Path
  }
  if(path_type%in% c("Spa","Spatial","spa","spatial")){
    Path <- paste(Main_Path,"/Spatial",sep="")
  }
  if(path_type%in% c("Spp","Species","spp","species")){
    Path <- paste(Main_Path,"/Species",sep="")
  }
  if(path_type%in% c("F","f","Figures","Figure","figure","figures")){
    Path <- "./Figures"
  }

  # Error messages for misspelled variables
  Options = c("R","Results","D","Data","G","Generic","F","Figures","Spa","Spatial","Spp","Species")
  if(!path_type %in% Options){
    print("Data type value not accepted. Current acceptable options:")
    print(Options)
    stop()
  }
  
  # If the reading option is TRUE
  if(read == TRUE){
    My_Path <- paste(Path,extra_path,name,sep="/")
    # Fix any double // in the path
    My_Path <- gsub("//","/",My_Path)
    if(stringr::str_detect(name,".xlsx") == TRUE){
      My_Path <- readxl::read_excel(My_Path) %>% janitor::clean_names()
    }else{
      My_Path <- data.table::fread(My_Path, header=header) %>% janitor::clean_names()
    }
    
    # Already load the coords with names
    if(name == "Lon_Lat_DBEM.txt"){
      
      colnames(My_Path) <- c("index","lon","lat")
    }
    
    
  }else{
    My_Path <- paste(Path,extra_path,name,sep="/")
    # Fix any double // in the path
    My_Path<- gsub("//","/",My_Path) 
  }
  
  # Function returns the selected path
  
  return(My_Path)
}

# Test me
# my_path("G", "Spatial/DBEM", "Lon_Lat_DBEM.txt", read = T)

