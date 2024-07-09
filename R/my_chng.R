#' Estimates percentage change
#'
#' This function simply estimnates a percentage change
#' of a variable with a limit on the scale
#'
#' @param v1 Type of path needed "D" for Data, "R", for Result and "G" for generic. You need those paths to be load in the global environment
#' @param v2 I normally call my data folder the same as the project so it automatically sets to the project name. Alternatives available.
#' @return A numeric value in percentage change from v2 relative to v1
#' @export

my_chng <- function(v1, v2, limit = NA){

  # Estimate percentage change
    x = ((v2-v1)/abs(v1))*100
    
    # Set scale limits if necessary
    if(!is.na(limit)){
      x <- ifelse(abs(x) > limit, limit, x)
    } 

  return(x)
}