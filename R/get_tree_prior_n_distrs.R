#' Get the number of distributions a tree prior has
#' @inheritParams default_params_doc
#' @return the number of distributions a tree prior has
#' @author Richèl J.C. Bilderbeek
#' @examples
#'  # birth_rate_distr and death_rate_distr
#'  testit::assert(
#'    beautier:::get_tree_prior_n_distrs(create_bd_tree_prior()) == 2
#'  )
#'
#'  # none
#'  testit::assert(
#'    beautier:::get_tree_prior_n_distrs(create_cbs_tree_prior()) == 0
#'  )
#'
#'  # pop_size_distr
#'  testit::assert(
#'    beautier:::get_tree_prior_n_distrs(create_ccp_tree_prior()) == 1
#'  )
#'
#'  # pop_size_distr and growth_rate_distr
#'  testit::assert(
#'    beautier:::get_tree_prior_n_distrs(create_cep_tree_prior()) == 2
#'  )
#'
#'  # birth_rate_distr
#'  testit::assert(
#'    beautier:::get_tree_prior_n_distrs(create_yule_tree_prior()) == 1
#'  )
#' @noRd
get_tree_prior_n_distrs <- function(
  tree_prior
) {
  if (!is_tree_prior(tree_prior)) { # nolint beautier function
    stop("'tree_prior' must be a tree prior")
  }
  if (is_bd_tree_prior(tree_prior)) { # nolint beautier function
    return(2)
  } else if (is_cbs_tree_prior(tree_prior)) { # nolint beautier function
    return(0)
  } else if (is_ccp_tree_prior(tree_prior)) { # nolint beautier function
    return(1)
  } else if (is_cep_tree_prior(tree_prior)) { # nolint beautier function
    return(2)
  } else {
    testit::assert(is_yule_tree_prior(tree_prior)) # nolint beautier function
    return(1)
  }
}
