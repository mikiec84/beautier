#' Get the number of parameters a distribution uses
#' @param distr a distribution,
#'   as created by \code{\link{create_distr}} or (preferable)
#'   its named functions
#' @return the number of parameters that distribution uses
#' @examples
#'   testit::assert(
#'     beautier:::get_distr_n_params(create_beta_distr()) == 2
#'   )
#'   testit::assert(
#'     beautier:::get_distr_n_params(create_exp_distr()) == 1
#'   )
#'   testit::assert(
#'     beautier:::get_distr_n_params(create_gamma_distr()) == 2
#'   )
#'   testit::assert(
#'     beautier:::get_distr_n_params(create_inv_gamma_distr()) == 2
#'   )
#'   testit::assert(
#'     beautier:::get_distr_n_params(create_laplace_distr()) == 2
#'   )
#'   testit::assert(
#'     beautier:::get_distr_n_params(create_log_normal_distr()) == 2
#'   )
#'   testit::assert(
#'     beautier:::get_distr_n_params(create_normal_distr()) == 2
#'   )
#'   testit::assert(
#'     beautier:::get_distr_n_params(create_one_div_x_distr()) == 0
#'   )
#'   testit::assert(
#'     beautier:::get_distr_n_params(create_poisson_distr()) == 1
#'   )
#'   testit::assert(
#'     beautier:::get_distr_n_params(create_uniform_distr()) == 0
#'   )
#' @author Richèl J.C. Bilderbeek
#' @noRd
get_distr_n_params <- function(
  distr
) {
  if (!is_distr(distr)) { # nolint beautier function
    stop("'distr' must be a distribution")
  }

  if (is_beta_distr(distr)) { # nolint beautier function
    return(2) # alpha and beta
  } else if (is_exp_distr(distr)) { # nolint beautier function
    return(1) # mean
  } else if (is_gamma_distr(distr)) { # nolint beautier function
    return(2) # alpha and beta
  } else if (is_inv_gamma_distr(distr)) { # nolint beautier function
    return(2) # alpha and beta
  } else if (is_laplace_distr(distr)) { # nolint beautier function
    return(2) # mu and scale
  } else if (is_log_normal_distr(distr)) { # nolint beautier function
    return(2) # m and s
  } else if (is_normal_distr(distr)) { # nolint beautier function
    return(2) # mean and sigma
  } else if (is_one_div_x_distr(distr)) { # nolint beautier function
    return(0) # none
  } else  if (is_poisson_distr(distr)) { # nolint beautier function
    return(1) # lambda
  } else {
    testit::assert(is_uniform_distr(distr)) # nolint beautier function
    return(0) # none
  }
}
