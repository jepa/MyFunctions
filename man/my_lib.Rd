% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/my_lib.R
\name{my_lib}
\alias{my_lib}
\title{Load and installs packages needed}
\usage{
my_lib(pkg_list)
}
\arguments{
\item{pkg_list}{List of packages to install}
}
\value{
Loads packages on global env.
}
\description{
This function loads all necessary packages. If the
package is not installed, it will install it first
and the it will load the recently installed package
}
