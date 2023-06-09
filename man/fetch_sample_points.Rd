% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fetch_sample_points.R
\name{fetch_sample_points}
\alias{fetch_sample_points}
\title{"fetch: sample points"}
\usage{
fetch_sample_points(
  status,
  type,
  area,
  easting,
  northing,
  distance,
  smpt_type,
  limit
)
}
\arguments{
\item{status}{can be "open" for sample points at which samples are currently
being taken, "closed" for sample points at which samples are not currently
being taken or not declared.}

\item{type}{sample point type}

\item{area}{area to help reduce the samples returned in the call}

\item{easting}{the easting of a point of interest, used with northing and distance}

\item{northing}{the northing of a point of interest, used with easting and distance}

\item{distance}{a distance to search for sample points from the point declared
in the easting and northing parameters}

\item{smpt_type}{the notation of the sampling point type}

\item{limit}{limit if you want to run the query quickly you can set a numeric limit}
}
\value{
returns the output of the API query based on the user search
}
\description{
"Pulls the sample point data from the DDSP API"
}
\examples{
fetch_sample_points(easting="527137", northing="335549", smpt_type="F6", distance=5)



# will return a dataframe containing all sample points that are within approximately
# 5km of the point declared in the easting and northing parameters, where the sample
# point type is "F6" (FRESHWATER - RIVERS)

}
