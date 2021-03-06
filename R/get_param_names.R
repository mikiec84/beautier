#' Get the parameter names
#' @return the parameter names
#' @author Richèl J.C. Bilderbeek
#' @examples
#'   names <- beautier:::get_param_names()
#'   testit::assert("alpha" %in% names)
#'   testit::assert("beta" %in% names)
#'   testit::assert("clock_rate" %in% names)
#'   testit::assert("kappa_1" %in% names)
#'   testit::assert("kappa_2" %in% names)
#'   testit::assert("lambda" %in% names)
#'   testit::assert("m" %in% names)
#'   testit::assert("mean" %in% names)
#'   testit::assert("mu" %in% names)
#'   testit::assert("rate_ac" %in% names)
#'   testit::assert("rate_ag" %in% names)
#'   testit::assert("rate_at" %in% names)
#'   testit::assert("rate_cg" %in% names)
#'   testit::assert("rate_ct" %in% names)
#'   testit::assert("rate_gt" %in% names)
#'   testit::assert("s" %in% names)
#'   testit::assert("scale" %in% names)
#'   testit::assert("sigma" %in% names)
#' @noRd
get_param_names <- function() {
  c(
    "alpha",
    "beta",
    "clock_rate",
    "lambda",
    "kappa_1",
    "kappa_2",
    "m",
    "mean",
    "mu",
    "rate_ac",
    "rate_ag",
    "rate_at",
    "rate_cg",
    "rate_ct",
    "rate_gt",
    "s",
    "scale",
    "sigma"
  )
}
