#' Converts a site model to XML,
#'   used in the \code{siteModel} section
#' @inheritParams default_params_doc
#' @return the site model as XML text
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
site_model_to_xml_lh_distr <- function(
  site_model
) {
  testit::assert(is_site_model(site_model)) # nolint beautier function
  id <- site_model$id
  testit::assert(is_id(id)) # nolint beautier function

  text <- NULL

  gamma_category_count <- site_model$gamma_site_model$gamma_cat_count
  if (gamma_category_count == 0) {
    text <- c(text, paste0("<siteModel id=\"SiteModel.s:",
      id, "\" spec=\"SiteModel\">")
    )
  } else if (gamma_category_count == 1) {
    text <- c(text, paste0("<siteModel id=\"SiteModel.s:",
      id, "\" spec=\"SiteModel\" gammaCategoryCount=\"", gamma_category_count,
      "\">")
    )
  } else {
    text <- c(text, paste0("<siteModel id=\"SiteModel.s:",
      id, "\" spec=\"SiteModel\" gammaCategoryCount=\"", gamma_category_count,
      "\" shape=\"@gammaShape.s:", id, "\">")
    )
  }

  text <- c(text, paste0("    <parameter ",
    "id=\"mutationRate.s:", id,
    "\" estimate=\"false\" name=\"mutationRate\">1.0</parameter>"))
  if (gamma_category_count < 2) {
    text <- c(text, paste0("    <parameter ",
      "id=\"gammaShape.s:", id,
      "\" estimate=\"false\" name=\"shape\">1.0</parameter>"))
  }

  # proportionInvariant
  text <- c(text, paste0(
    "    <parameter id=\"proportionInvariant.s:",
    id, "\" estimate=\"false\" lower=\"0.0\" ",
    "name=\"proportionInvariant\" upper=\"1.0\">",
    site_model$gamma_site_model$prop_invariant,
    "</parameter>"))

  text <- c(text,
    indent( # nolint beautier function
      site_model_to_xml_subst_model(site_model), # nolint beautier function
      n_spaces = 4
    )
  )

  text <- c(text, "</siteModel>")

  text
}
