#' Create a clock model from name
#' @inheritParams default_params_doc
#' @author Richel J.C. Bilderbeek
#' @examples
#'   clock_model_names <- get_clock_model_names()
#'   for (clock_model_name in clock_model_names) {
#'     clock_model <- create_clock_model_from_name(clock_model_name)
#'     testthat::expect_equal(clock_model_name, clock_model$name)
#'   }
#' @export
create_clock_model_from_name <- function(clock_model_name) {
  if (clock_model_name == "strict") {
    beautier::create_strict_clock_model()
  } else {
    testit::assert(clock_model_name == "relaxed_log_normal")
    beautier::create_rln_clock_model()
  }
}