#' Check if the phylogeny is a valid phylogeny object.
#'
#' Calls \code{stop} if the phylogeny is invalid
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#'  phylogeny <- ape::read.tree(text = "(A:1, B:1):1;")
#'  testthat::expect_silent(check_phylogeny(phylogeny))
#'
#'  # Must stop on non-phylogenies
#'  testthat::expect_error(check_phylogeny(phylo = "nonsense"))
#'  testthat::expect_error(check_phylogeny(phylo = NULL))
#'  testthat::expect_error(check_phylogeny(phylo = NA))
#' @author Richel J.C. Bilderbeek
#' @export
check_phylogeny <- function(phylogeny) {
  if (class(phylogeny) == "phylo") {
    return()
  }
  stop(
    "'phylogeny' must be a valid phylogeny.\n",
    "Actual value: ", phylogeny
  )
}