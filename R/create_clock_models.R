#' Creates all supported clock models,
#'   which is a list of the types returned by
#'   \code{\link{create_rln_clock_model}},
#'   and \code{\link{create_strict_clock_model}}
#' @return a list of site_models
#' @seealso Use \link{create_clock_model} to create a clock model
#' @examples
#'  clock_models <- create_clock_models()
#'  testit::assert(beautier:::is_rln_clock_model(clock_models[[1]]))
#'  testit::assert(beautier:::is_strict_clock_model(clock_models[[2]]))
#' @author Richèl J.C. Bilderbeek
#' @export
create_clock_models <- function() {
  list(
    create_rln_clock_model(),
    create_strict_clock_model()
  )
}
