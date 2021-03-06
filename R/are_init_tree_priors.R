#' Determine if x consists out of initialized tree_priors objects
#' @param x the object to check if it consists out of
#'   initialized tree_priors objects
#' @return TRUE if x, or all elements of x, are initialized tree_prior objects
#' @author Richèl J.C. Bilderbeek
#' @noRd
are_init_tree_priors <- function(
  x
) {
  if (!are_tree_priors(x)) return(FALSE) # nolint beautier function
  for (i in x) {
    if (!is_init_tree_prior(i)) return(FALSE)   # nolint beautier function call
  }
  TRUE
}
