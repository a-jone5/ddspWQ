#'"helper: Sample Point Types"
#'
#'"Searches the sample point type list for sample points of interest based
#'on pattern matches"
#'@importFrom utils read.csv
#'@param smpt_type_name word or part of word to search the list for (ignores case).
#'if left blank returns all sample point types
#'@return returns the output of the API query based on the user search
#'@examples
#'smpt_types <- helper_smpt_type(smpt_type_name = "mine")
#'
#'# will provide a df with all the sample point types that contain "mine"
#'
#'@export
helper_smpt_type <- function(smpt_type_name){

  ini <- utils::read.csv("https://environment.data.gov.uk/water-quality/def/sampling-point-types.csv?_limit=999999&_sort=label")

  if(missing(smpt_type_name)){

    smpt_type_all <- ini[,c(2,5,7)]

    return(smpt_type_all)

  } else {

    smpt_type_filt <- ini[which(grepl(smpt_type_name,ini$label,ignore.case = T)),
                          c(2,5,7),
                          drop = FALSE]

    return(smpt_type_filt)

  }

}
