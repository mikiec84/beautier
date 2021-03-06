#' Determine if x is an initialized gamma site model,
#' as created by \code{\link{create_gamma_site_model}}
#' @param x the object to check if it is an
#'   initialized gamma site_models object
#' @return TRUE if x is an initialized gamma site model
#' @author Richèl J.C. Bilderbeek
#' @noRd
is_init_gamma_site_model <- function(
  x
) {
  if (!is_gamma_site_model(x)) return(FALSE) # nolint beautier function
  if (is_one_na(x$gamma_shape_prior_distr)) return(TRUE) # nolint beautier function
  if (!is_init_distr(x$gamma_shape_prior_distr)) return(FALSE) # nolint beautier function
  TRUE
}
