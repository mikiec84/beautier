#' Converts one or more clock models to the \code{state} section of the
#' XML as text
#' @inheritParams default_params_doc
#' @return lines of XML text, without indentation nor \code{state}
#'   tags
#' @author Richèl J.C. Bilderbeek
#' @noRd
clock_models_to_xml_state <- function(
  clock_models,
  mrca_priors = NA,
  has_tip_dating = FALSE
) {
  # the mrca_priors are supposed to be temporary :-)
  testit::assert(are_clock_models(clock_models)) # nolint beautier function

  if (length(clock_models) == 1 &&
      is_strict_clock_model(clock_models[[1]]) &&
    has_tip_dating == FALSE
  ) { # nolint beautier function
    return(NULL)
  }

  text <- NULL

  for (clock_model in clock_models) {
    text <- c(text,
      clock_model_to_xml_state(
        clock_model = clock_model,
        has_tip_dating = has_tip_dating
      )
    )
  }

  # Remove the first line of the first clock model,
  # if no MRCA prior with a distribution is used
  if (is_rln_clock_model(clock_models[[1]]) && # nolint beautier function
      !is_mrca_prior_with_distr(mrca_priors[[1]])) { # nolint beautier function
    # A RLN clock model returns three lines, only remove the first
    line_to_remove <- clock_model_to_xml_state(clock_models[[1]]) # nolint
    testit::assert(length(line_to_remove) == 3)
    text <- line_to_remove[
      stringr::str_remove_all(
        string = line_to_remove, pattern = ".*ucldMean\\.c:.*"
      ) != ""
    ]
  }
  text
}
