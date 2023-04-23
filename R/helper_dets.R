#'"helper: determinands"
#'
#'"Searches the determinands (dets) list for potential determinands of interest based
#'on pattern matches"
#'@importFrom utils read.csv
#'@param det_name word or part of word to search the list for (ignores case)
#'@return returns the output of the API query based on the user search
#'@examples
#'helper_dets("BOD")
#'
#'# will provide a df with all the dets that contain "bod"
#'
#'@export
helper_dets <- function(det_name){

  ini <- utils::read.csv("https://environment.data.gov.uk/water-quality/def/determinands.csv?_limit=999999&_sort=label")

  dets <- ini[which(grepl(det_name,ini$definition,ignore.case = T)),
                   2:5,
                   drop = FALSE]

  return(dets)

}
