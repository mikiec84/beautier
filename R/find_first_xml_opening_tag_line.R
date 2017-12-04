#' Find the line number of the first section's opening tag
#' @param lines the lines of an XML text
#' @param section the name of the XML section
#' @return the line number's index (which is 1 for the first line) if the
#'   opening tag is found, else NA
find_first_xml_opening_tag_line <- function(
  lines,
  section
) {
  if (!is.character(section)) {
    stop("'section' must be a word")
  }
  for (i in seq_along(lines)) {
    match <- stringr::str_extract(
      str = lines[i],
      pattern = paste0("<", section, ".*>")
    )
    if (!is.na(match)) return(i)
  }
  NA
}