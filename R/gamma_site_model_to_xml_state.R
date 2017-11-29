#' Converts a gamma site model to XML,
#'   used in the \code{state} section
#' @param id the site model's ID
#' @param gamma_site_model a gamma site model,
#'   as created by \code{\link{create_gamma_site_model}})
#' @return the gamma_site model as XML text
#' @author Richel J.C. Bilderbeek
gamma_site_model_to_xml_state <- function(
  gamma_site_model,
  id
) {
  testit::assert(beautier::is_gamma_site_model(gamma_site_model))
  testit::assert(beautier::is_id(id))
  paste0("<parameter id=\"gammaShape.s:", id, "\" ",
    "name=\"stateNode\">",
    beautier::get_gamma_shape(gamma_site_model),
    "</parameter>"
  )
}