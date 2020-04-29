#' Load and installs packages needed
#'
#' This function loads all necessary packages. If the
#' package is not installed, it will install it first
#' and the it will load the recently installed package
#'
#' @param Path_Type Type of path needed "D" for Data, "R", for Result and "G" for generic. You need those paths to be load in the global environment
#' @param Project I normally call my data folder the same as the project so it automatically sets to the project name. Alternatives available.
#' @param Extra_Path Any sub-path to add WITHIN the folders. Note, if it is before, include it on the "Folder" parameter -e.g. Project/SubFolder -
#' @param Name Dataset name in case you want the option to load data
#' @param Repo Normally set to jepa88 but if connection to Drobo is availbale use Repo = "Drobo"
#' @param Option There are three options; RT reads a .txt file, RC reads a .csv file and P set the path. Default P
#' @return Paths to save and load data within a project
#' @export
my_path <- function(Path_Type,Project = NA,Extra_Path="",Name ="",Repo = NA, Option="P"){
  
  # Main path where I store my data
  if(is.na(Repo) == TRUE){
    Main_Path <- "/Volumes/jepa88/Data" # jepa88 (pre-selected)
  }else{
    Main_Path <- "Volumes/DATA/JULIANO_NEYMAR" #If Drobo is needed
  }
  
  # Automatically sets the project name
  if(is.na(Project) == TRUE){
    Project <- basename(getwd())
    }else{
    Project <- Project # If another path is needed
  }
  
  # Set Project Data, Generic Data, Results and Figures paths
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
  
  # Error messages for misspelled variables
  Options = c("R","Results","D","Data","G","Generic","F","Figures")
  if(!Path_Type %in% Options){
    print("Data type value not accepted. Current acceptable options:")
    print(Options)
    stop()
  }
  
  # Final path
  
  if(Option == "RT"){
    my_path <- data.table::fread(paste(Path,Extra_Path,"",Name,".txt",sep=""))
  }
  if(Option == "RC"){
    my_path <- data.table::fread(paste(Path,Extra_Path,"",Name,".csv",sep=""))
  }
  if(Option == "P"){
    my_path <- paste(Path,Extra_Path,"",sep="/")
  }
  
  # Fix any double // in the path
  my_path<- gsub("//","/",my_path)
  
  # Function returns the selected path
  return(my_path)
}