#' Determine if x consists out of tree_priors objects
#' @param x the object to check if it consists out of tree_priors objects
#' @return TRUE if x, or all elements of x, are tree_prior objects
#' @seealso Use \link{create_yule_tree_prior} to create a Yule tree prior
#' @examples
#'   yule_tree_prior <- create_yule_tree_prior()
#'   bd_tree_prior <- create_bd_tree_prior()
#'   both_tree_priors <- list(yule_tree_prior, bd_tree_prior)
#'   testit::assert(are_tree_priors(yule_tree_prior))
#'   testit::assert(are_tree_priors(bd_tree_prior))
#'   testit::assert(are_tree_priors(both_tree_priors))
#' @author Richèl J.C. Bilderbeek
#' @export
are_tree_priors <- function(
  x
) {
  if (is.null(x)) return(FALSE)
  if (is_tree_prior(x)) { # nolint beautier function
    return(TRUE)
  }
  for (i in x) {
    if (!is_tree_prior(i)) return(FALSE) # nolint beautier function
  }
  return(TRUE)
}
