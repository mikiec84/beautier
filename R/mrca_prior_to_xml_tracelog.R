#' Creates the mrca prior's XML for the tracelog section
#' @inheritParams default_params_doc
#' @seealso all mrca priors' tracelog section is created
#'   by \code{\link{mrca_priors_to_xml_tracelog}}
#' @examples
#' # <logger id="tracelog" ...>
#' #'   # Here
#' # </logger>
#' @author Richel J.C. Bilderbeek
mrca_prior_to_xml_tracelog <- function( # nolint internal function
  mrca_prior
) {
  testit::assert(is_mrca_prior(mrca_prior))
  if (length(mrca_prior) == 1 && is.na(mrca_prior)) return(NULL)

  text <- NULL
  text <- c(text, paste0("<log idref=\"", mrca_prior$name, ".prior\"/>"))
  text <- c(
    text,
    paste0(
      "<log idref=\"clockRate.c:", mrca_prior$alignment_id, "\"/>"
    )
  )

  text
}