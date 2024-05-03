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
#'@param smpt_type the notation of the sampling point type
#'@param limit limit if you want to run the query quickly you can set a numeric limit
#'@return returns the output of the API query based on the user search
#'@examples
#'fetch_sample_points(easting="527137", northing="335549", smpt_type="F6", distance=5)
#'
#'
#'
#'# will return a dataframe containing all sample points that are within approximately
#'# 5km of the point declared in the easting and northing parameters, where the sample
#'# point type is "F6" (FRESHWATER - RIVERS)
#'
#'@export
fetch_sample_points <- function(status,type,area,easting,northing,distance,smpt_type,limit){

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

    paste0("area=",paste(area,collapse = "&area="))

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

    NULL

  } else {

    paste0("dist=",distance)

  }

  smpt_type <- if(missing(smpt_type)){

    NULL

  } else {

    smpt_type <- paste0("samplingPointType=",paste(smpt_type,collapse = "&samplingPointType="))

  }

  limit <- if(missing(limit)){

    paste0("_limit=9999999")

  } else {

    paste0("_limit=",limit)

  }

  nn_queries <- list(c(status,type,area,easting,northing,distance,smpt_type,limit))

  dat <- utils::read.csv(paste0(url,paste(nn_queries[[1]],collapse = "&")))

  return(dat)

}

