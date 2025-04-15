#' Creates DBEM grid for Compute Canada
#'
#' This function transforms an ocean grid to the format readable
#' by the DBEM in Compute Canada
#'
#' @param data the dataset containing the grid. Note it must be 259200 observations to match the DBEM grid
#' @param column_name the column that is to be transformed to the DBEM
#' @param path path were data is to be saved
#' @param scen_name data set name, no need to inlcude .txt
#' @return 
#' @export
my_mpa_cedar <- function(data,column_name,path,scen_name){
  file_name <- paste0(scen_name,".txt")
  
  data %>%
    select(any_of(column_name)) %>%
    write.table(file = paste0(path,"/",file_name),
                sep="\t", col.names = F, row.names = F)
  
  output <- paste0("Created MPA scenario in path: ",path,scen_name)
  
  return(output)
  
  
}