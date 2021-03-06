#' Determine if an object is a valid tree prior
#' @param x an object
#' @return TRUE if x is a valid tree_prior, FALSE otherwise
#' @seealso tree priors can be created by \code{\link{create_tree_prior}})
#' @author Richèl J.C. Bilderbeek
#' @examples
#'   testit::assert(is_tree_prior(create_bd_tree_prior()))
#'   testit::assert(is_tree_prior(create_yule_tree_prior()))
#'   testit::assert(!is_tree_prior("nonsense"))
#' @export
is_tree_prior <- function(
  x
) {
  if (!"name" %in% names(x)) return(FALSE)
  if (!is_tree_prior_name(x$name)) return(FALSE) # nolint beautier function
  if (!"id" %in% names(x)) return(FALSE)
  TRUE
}

#' Determine if the object is a valid Birth Death tree prior
#'   as returned by \code{\link{create_bd_tree_prior}}
#' @param x an object, to be determined if it is a valid birth death tree prior
#' @return TRUE if x is a valid birth death tree prior, FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @noRd
is_bd_tree_prior <- function(
  x
) {
  if (!"name" %in% names(x)) return(FALSE)
  if (x$name != "birth_death") return(FALSE)
  if (!"birth_rate_distr" %in% names(x)) return(FALSE)
  if (!"death_rate_distr" %in% names(x)) return(FALSE)
  TRUE
}

#' Determine if the object is a valid constant coalescent Bayesian skyline prior
#'   as returned by \code{\link{create_cbs_tree_prior}}
#' @param x an object, to be determined if it is a valid constant coalescent
#'   Bayesian skyline prior
#' @return TRUE if x is a valid constant coalescent Bayesian skyline prior,
#'   FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @noRd
is_cbs_tree_prior <- function(
  x
) {
  if (!"name" %in% names(x)) return(FALSE)
  if (x$name != "coalescent_bayesian_skyline") return(FALSE)
  if (!"group_sizes_dimension" %in% names(x)) return(FALSE)
  TRUE
}

#' Determine if the object is a valid
#'   constant coalescence population tree prior,
#'   as returned by \code{\link{create_ccp_tree_prior}}
#' @param x an object, to be determined if it is a valid
#'   constant coalescence population tree prior
#' @return TRUE if x is a valid constant coalescence population tree prior,
#'   FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @noRd
is_ccp_tree_prior <- function(
  x
) {
  if (!"name" %in% names(x)) return(FALSE)
  if (x$name != "coalescent_constant_population") return(FALSE)
  if (!"pop_size_distr" %in% names(x)) return(FALSE)
  TRUE
}

#' Determine if the object is a valid
#' coalescent exponential population tree prior
#'   as returned by \code{\link{create_cep_tree_prior}}
#' @param x an object, to be determined if it is a valid
#'   constant coalescent exponential population tree prior
#' @return TRUE if x is a valid coalescent exponentialpopulation tree prior,
#'   FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @noRd
is_cep_tree_prior <- function(
  x
) {
  if (!"name" %in% names(x)) return(FALSE)
  if (x$name != "coalescent_exp_population") return(FALSE)
  if (!"pop_size_distr" %in% names(x)) return(FALSE)
  if (!"growth_rate_distr" %in% names(x)) return(FALSE)
  TRUE
}

#' Determine if the object is a valid Yule tree prior,
#'   as returned by \code{\link{create_yule_tree_prior}}
#' @param x an object, to be determined if it is a valid Yule tree prior
#' @return TRUE if x is a valid Yule tree prior, FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @noRd
is_yule_tree_prior <- function(
  x
) {
  if (is.list(x) && length(x) == 1) return(is_yule_tree_prior(x[[1]])) # nolint beautier function
  if (!"name" %in% names(x)) return(FALSE)
  if (x$name != "yule") return(FALSE)
  if (!"birth_rate_distr" %in% names(x)) return(FALSE)
  TRUE
}
