#' Find the highest line number of a section's closing tag
#' @param lines the lines of an XML text
#' @param section the name of the XML section
#' @return the line number's index (which is 1 for the first line) if the
#'   opening tag is found, else NA
#' @author Richèl J.C. Bilderbeek
#' @noRd
find_last_xml_closing_tag_line <- function(
  lines,
  section
) {
  if (!is.character(section)) {
    stop("'section' must be a word")
  }
  find_last_regex_line(lines, paste0("</", section, ">")) # nolint beautier function
}
