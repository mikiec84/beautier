#' Determine if x consists out of clock_models objects
#' @param x the object to check if it consists out of clock_models objects
#' @return TRUE if x, or all elements of x, are clock_model objects
#' @author Richel J.C. Bilderbeek
#' @export
are_clock_models <- function(
  x
) {
  if (is.null(x)) return(FALSE)
  if (beautier::is_clock_model(x)) return(TRUE)
  for (i in x) {
    if (!beautier::is_clock_model(i)) return(FALSE)
  }
  return(TRUE)
}