#' Creates a project basic structure
#'
#' This function creates all the directories that I normally
#' use in all my projects. It creats them im bothe the Github 
#' R project as rell as the data Repository
#'
#' @param Repo Main data repository. Currently set to HALL2000
#' @return Creates a series of directories that follow the basic structure of all my projects
#' @export
my_project <- function(Repo = "one_drive"){
  
  # Get the projects name
  Project <- basename(getwd())
  
  # Create base directories in Github Repo
  dir.create("scripts")
  dir.create("results")
  dir.create("results/figures")
  dir.create("results/tables")
  dir.create("documents")
  
  # Create data repos in Hall2000
  if(Repo == "Enterprise"){
    
    if(dir.exists("/Volumes/Enterprise/") == TRUE){
      
      # Main Data repo for project
      dir.create(paste("/Volumes/Enterprise/Data/",Project,sep=""))
      
      # Spatial data repo
      dir.create(paste("/Volumes/Enterprise/Data/",Project,"/Spatial",sep=""))
      
      # Species data repo
      dir.create(paste("/Volumes/Enterprise/Data/",Project,"/Species",sep=""))
      
      # Raw results 
      dir.create(paste("/Volumes/Enterprise/Data/",Project,"/Raw",sep=""))
      
    }else{
      print("Enterprise is not connected. Do you need to change the Repo?")
    }
  }
  
  if(Repo == "one_drive"){
    
    if(dir.exists("~/Library/CloudStorage/OneDrive-UBC/Data/") == TRUE){
      
      # Main project repo
      dir.create(paste("~/Library/CloudStorage/OneDrive-UBC/Data/",Project,sep=""))
      
      # Main Data repo for project
      dir.create(paste("~/Library/CloudStorage/OneDrive-UBC/Data/",Project,"/data",sep=""))
      
      # Spatial data repo
      dir.create(paste("~/Library/CloudStorage/OneDrive-UBC/Data/",Project,"/data/spatial",sep=""))
      
      # Species data repo
      dir.create(paste("~/Library/CloudStorage/OneDrive-UBC/Data/",Project,"/data/species",sep=""))
      
      # Raw results 
      dir.create(paste("~/Library/CloudStorage/OneDrive-UBC/Data/",Project,"/results/",sep=""))
      
      # Figures results 
      dir.create(paste("~/Library/CloudStorage/OneDrive-UBC/Data/",Project,"/results/figures/",sep=""))
      
      # Tables results 
      dir.create(paste("~/Library/CloudStorage/OneDrive-UBC/Data/",Project,"/results/tables/",sep=""))
      
      
    }else{
      print("No connection with One Drive UBC Data. Do you need to change the Repo? Try Enterprise")
    }
  }
}



