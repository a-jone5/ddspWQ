#'"helper: EA Areas"
#'
#'"Searches the area list for areas of interest based
#'on pattern matches"
#'@importFrom utils read.csv
#'@param ea_area word or part of word to search the list for (ignores case).
#'if left blank returns all EA areas.
#'@return returns the output of the API query based on the user search
#'@examples
#'smpt_types <- helper_ea_areas(ea_area = "man")
#'
#'# will provide a df with all the sample point types that contain "mine"
#'
#'@export
helper_ea_area <- function(ea_area){

  ini <- utils::read.csv("https://environment.data.gov.uk/water-quality/id/ea-area.csv")

  if(missing(ea_area)){

    ea_area_all <- ini[,c(2,4,5)]

    return(ea_area_all)

  } else {

    smpt_type_filt <- ini[which(grepl(ea_area,ini$label,ignore.case = T)),
                          c(2,4,5),
                          drop = FALSE]

    return(smpt_type_filt)

  }

}
