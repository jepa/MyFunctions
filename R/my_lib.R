#' Load and installs packages needed
#'
#' This function loads all necessary packages. If the
#' package is not installed, it will install it first
#' and the it will load the recently installed package
#'
#' @param pkg_list List of packages to install
#' @return Loads packages on global env.
#' @export
my_lib <- function(pkg_list){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE,repos = "http://cran.us.r-project.org")
  sapply(pkg, require, character.only = TRUE)
}