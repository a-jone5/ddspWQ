#'"fetch: sample points"
#'
#'"Pulls the sample point data from the DDSP API"
#'@importFrom utils read.csv
#'@param status can be "open" for sample points at which samples are currently
#'being taken, "closed" for sample points at which samples are not currently
#'being taken or not declared.
#'@param type sample point type
#'@param area area to help reduce the samples returned in the call
#'@param easting the easting of a point of interest, used with northing and distance
#'@param northing the northing of a point of interest, used with easting and distance
#'@param distance a distance to search for sample points from the point declared
#'in the easting and northing parameters
#'@param limit limit if you want to run the query quickly you can set a numeric limit
#'@return returns the output of the API query based on the user search
#'@examples
#'fetch_sample_points(easting="527137", northing="335549", distance = 5)
#'
#'
#'
#'# will return a dataframe containing all sample points that are within approximately
#'# 5km of the point decalred in the easting and northing parameters
#'
#'@export
fetch_sample_points <- function(status,type,area,easting,northing,distance,limit){

  url <- "https://environment.data.gov.uk/water-quality/id/sampling-point.csv?"

  status <- if(missing(status)){

    NULL

  } else {

    paste0("samplingPointStatus=",status)

  }

  type <- if(missing(type)){

    NULL

  } else {

    paste0("samplingPointType=",type)

  }

  area <- if(missing(area)){

    NULL

  } else {

    paste0("area=",area)

  }

  easting <- if(missing(easting)){

    NULL

  } else {

    paste0("easting=",easting)

  }

  northing <- if(missing(northing)){

    NULL

  } else {

    paste0("northing=",northing)

  }

  distance <- if(missing(distance)){

    paste0("dist=10")

  } else {

    paste0("dist=",distance)

  }

  limit <- if(missing(limit)){

    paste0("_limit=9999999")

  } else {

    paste0("_limit=",limit)

  }

  nn_queries <- list(c(status,type,area,easting,northing,distance,limit))

  dat <- utils::read.csv(paste0(url,paste(nn_queries[[1]],collapse = "&")))

  return(dat)

}
