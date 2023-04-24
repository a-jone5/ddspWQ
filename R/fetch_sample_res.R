#'"fetch: sample results"
#'
#'"Pulls the data from the DDSP API for the required sample points acquired
#'from the sample_points function"
#'@importFrom utils read.csv
#'@param site_notation Either a single site can be submitted ("site_notation1"),
#'a number or specifc sites (c(site_notation1,site_notation2))
#'@param df if the sample point function is saved to a dataframe the column
#'can be used (df$notation)
#'@param dets one or more determinands can be requested using the same logic
#'as above
#'@param start_date a date for the start of the data in a YYYY-mm-dd format
#'@param end_date a date for the end of the data in a YYYY-mm-dd format
#'@param limit if you want to run the query quickly you can set a numeric limit
#'@return returns the output of the API query based on the user search
#'@examples
#'fetch_sample_res(site_notation = "AN-FBRO100F", dets = c("0085","0111"))
#'
#'# will return a dataframe containing the BOD (0085) and ammonia (0111)
#'# for all the sample point provided
#'
#'@export
fetch_sample_res <- function(df, site_notation, dets, start_date, end_date, limit){

  url <- "https://environment.data.gov.uk/water-quality/data/measurement.csv?"

  df <- if(missing(df)){

  } else {

    df

  }

  start_date <- if(missing(start_date)){

    NULL

  } else {

    paste0("start_date=",start_date)

  }

  end_date <- if(missing(end_date)){

    NULL

  } else {

    paste0("end_date=",end_date)

  }

  site_notation <- if(missing(site_notation)){

    NULL

  } else {

    paste0("samplingPoint=",site_notation)

  }

  dets <- if(missing(dets)){

    NULL

  } else {

    dets <- paste0("determinand=",paste(dets,collapse = "&determinand="))

  }

  limit <- if(missing(limit)){

    paste0("_limit=9999999")

  } else {

    paste0("_limit=",limit)

  }

  dat <- data.frame()

  if(is.character(site_notation) && missing(df)){

    nn_queries <- list(c(site_notation,dets,start_date,end_date,limit))

    dat <- rbind(dat,read.csv(paste0(url,paste(nn_queries[[1]],collapse = "&"))))

  } else if(is.null(site_notation) && missing(df)==FALSE){

    for(i in 1:length(df$notation)){

      nn_queries <- list(c(dets,start_date,end_date,limit))

      dat <- rbind(dat,utils::read.csv(paste0(url,"samplingPoint=",df$notation[1],"&",paste(nn_queries[[1]],collapse = "&"))))

    }

  }

  else{


  }

  dat <- dat[,-c(1:2)]

  return(dat)

}
