#' Converts an MRCA prior to the \code{branchRateModel} section of the
#' XML as text.
#'
#' This function will be called if and only if there are MRCA priors
#' and only supports strict clocks at the moment.
#' @inheritParams default_params_doc
#' @return lines of XML text
#' @author Richèl J.C. Bilderbeek
#' @examples
#'  # <distribution id="posterior" spec="util.CompoundDistribution">
#'  #     <distribution id="prior" spec="util.CompoundDistribution">
#'  #     </distribution>
#'  #     <distribution id="likelihood" ...>
#'  #       HERE, where the ID of the distribution is 'likelihood'
#'  #     </distribution>
#'  # </distribution>
#' @noRd
mrca_prior_to_xml_lh_distr <- function(
  mrca_prior,
  has_non_strict_clock_model = FALSE
) {
  testit::assert(is_mrca_prior(mrca_prior)) # nolint beautier function
  if (length(mrca_prior) == 1 && is.na(mrca_prior)) return(NULL)
  if (!has_non_strict_clock_model && # nolint beautier function
    !is.na(mrca_prior$mrca_distr)
  ) {
    testit::assert(!is_one_na(mrca_prior$alignment_id)) # nolint beautier function
    paste0(
      "<branchRateModel ",
      "id=\"StrictClock.c:", mrca_prior$alignment_id, "\" ",
      "spec=\"beast.evolution.branchratemodel.StrictClockModel\" ",
      "clock.rate=\"@clockRate.c:", mrca_prior$alignment_id, "\"/>"
    )
  } else if (!has_non_strict_clock_model) {
    text <- NULL
    testit::assert(!is_one_na(mrca_prior$alignment_id)) # nolint beautier function
    text <- c(
      text,
      paste0(
        "<branchRateModel id=\"StrictClock.c:", mrca_prior$alignment_id, "\" ",
        "spec=\"beast.evolution.branchratemodel.StrictClockModel\">"
      )
    )
    testit::assert(!is_one_na(mrca_prior$alignment_id)) # nolint beautier function
    text <- c(
      text,
      paste0(
        "    <parameter id=\"clockRate.c:", mrca_prior$alignment_id, "\" ",
        "estimate=\"false\" name=\"clock.rate\">1.0</parameter>"
      )
    )
    text <- c(text, paste0("</branchRateModel>"))
    text
  }
}
