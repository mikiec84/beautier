#' Get the number of parameters a list of tree priors has
#' @param tree_priors a list of tree_priors,
#'   as created by the \code{\link{create_tree_prior}} functions
#' @return the number of parameters the tree priors have
#' @author Richel J.C. Bilderbeek
#' @examples
#'  testit::assert(
#'    get_tree_priors_n_params(
#'      list(
#'        create_bd_tree_prior(), # zero
#'        create_cep_tree_prior() # two
#'      )
#'    ) == 2
#'  )
#' @export
get_tree_priors_n_params <- function(
  tree_priors
) {
  if (!beautier::are_tree_priors(tree_priors)) {
    stop("'tree_priors' must be a list of tree priors")
  }
  n <- 0
  for (tree_prior in tree_priors) {
    n <- n + beautier::get_tree_prior_n_params(tree_prior)
  }
  n
}