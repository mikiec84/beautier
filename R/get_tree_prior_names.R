#' Get the tree prior names
#' @return the tree prior names
#' @export
get_tree_prior_names <- function() {
  return(c("yule", "birth_death", "coalescent_constant_population"))
}