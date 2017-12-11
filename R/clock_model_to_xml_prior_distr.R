#' Converts a clock model to the \code{prior} section of the
#' XML as text
#' @inheritParams default_params_doc
#' @param is_first boolean that indicates if the clock model is the first
#'   of many (can be one, two or more)
#' @author Richel J.C. Bilderbeek
#' @examples
#'  # <distribution id="posterior" spec="util.CompoundDistribution">
#'  #     <distribution id="prior" spec="util.CompoundDistribution">
#'  #       HERE, where the ID of the distribution is 'prior'
#'  #     </distribution>
#'  #     <distribution id="likelihood" ...>
#'  #     </distribution>
#'  # </distribution>
clock_model_to_xml_prior_distr <- function(
  clock_model,
  is_first = TRUE
) {
  testit::assert(beautier::is_clock_model(clock_model))
  id <- clock_model$id
  testit::assert(beautier::is_id(id))

  text <- NULL
  if (is_rln_clock_model(clock_model)) {

    if (is_first == FALSE) {
      text <- c(text, rln_clock_model_to_xml_mean_rate_prior(clock_model)) # nolint internal function
    }

    text <- c(text, paste0("<prior ",
      "id=\"ucldStdevPrior.c:", id, "\" name=\"distribution\" ",
      "x=\"@ucldStdev.c:", id, "\">"))
    text <- c(text,
      indent(
        distr_to_xml(
          distr = clock_model$ucldstdev_distr
        ),
        n_spaces = 4
      )
    )
    text <- c(text, paste0("</prior>"))
  } else {
    # Fails for unimplemented clock models
    testit::assert(beautier::is_strict_clock_model(clock_model))

    if (is_first == FALSE) {
      text <- c(text, paste0("<prior id=\"ClockPrior.c:", id, "\" ",
        "name=\"distribution\" x=\"@clockRate.c:", id, "\">"))
      text <- c(text, indent(
        distr_to_xml(clock_model$clock_rate_distr), n_spaces = 4))
      text <- c(text, paste0("</prior>"))
    }
  }
  text
}