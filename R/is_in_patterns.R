#' Is there at least one regular expression having a match with the line?
#' @param line a line of text
#' @param patterns one or more regular expression patterns
#' @return TRUE if there is at least one match found
#' @author Richèl J.C. Bilderbeek
#' @noRd
is_in_patterns <- function(line, patterns) {

  for (pattern in patterns) {
    if (!is.na(stringr::str_match(string = line, pattern = pattern)[1, 1])
    ) {
      return(TRUE)
    }
  }
  FALSE
}
