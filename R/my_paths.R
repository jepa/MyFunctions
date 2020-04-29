#' Load and installs packages needed
#'
#' This function loads all necessary packages. If the
#' package is not installed, it will install it first
#' and the it will load the recently installed package
#'
#' @param Path_Type Type of path needed "D" for Data, "R", for Result and "G" for generic. You need those paths to be load in the global environment
#' @param Project I normally call my data folder the same as the projec so it automatically sets to the project name. Alternatives available.
#' @param Extra_Path Any sub-path to add WITHIN the folders. Note, if it is before, include it on the "Folder" parameter -e.g. Project/SubFolder -
#' @return Paths to save and load data within a project
#' @export
my_path <- function(Path_Type,Project="NA",Extra_Path="",Name =""){
  
  Main_Path <- "~/Volumes/jepa88/Data"
  if(is.na(Project) == TRUE){
  Project <- basename(getwd())}
  else{
    Project <- Project
  }
  
  if(Path_Type == "R" | Path_Type == "Result"){
    Path <- paste(Main_Path,Project,"Results",sep="/")
  }
  if(Path_Type == "D" | Path_Type == "Data"){
    Path <- paste(Main_Path,Project,"Data",sep="/")
  }
  if(Path_Type == "G" | Path_Type == "Generic"){
    Path <- Main_Path
  }
  if(Path_Type == "F" | Path_Type == "Figures"){
    Path <- "./Figures"
  }
  
  Options = c("R","Results","D","Data","G","Generic","F","Figures")
  if(!Path_Type %in% Options){
    print("Data type value not acepted. Current aceptable options:")
    print(Options)
    stop()
  }
  
  my_path <- paste(Path,Extra_Path,"",sep="/")
  
  # Fix any double // in the path
  my_path<- gsub("//","/",my_path)
  
  return(my_path)
}
