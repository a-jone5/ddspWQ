% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helper_smpt_type.R
\name{helper_smpt_type}
\alias{helper_smpt_type}
\title{"helper: Sample Point Types"}
\usage{
helper_smpt_type(smpt_type_name)
}
\arguments{
\item{smpt_type_name}{word or part of word to search the list for (ignores case).
if left blank returns all sample point types}
}
\value{
returns the output of the API query based on the user search
}
\description{
"Searches the sample point type list for sample points of interest based
on pattern matches"
}
\examples{
smpt_types <- helper_smpt_type(smpt_type_name = "mine")

# will provide a df with all the sample point types that contain "mine"

}
