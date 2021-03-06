#' Creates the tree prior's XML for the tracelog section
#' @inheritParams default_params_doc
#' @return lines of XML text
#' @seealso all tree priors' tracelog section is created
#'   by \code{\link{tree_priors_to_xml_tracelog}}
#' @examples
#' # <logger id="tracelog" ...>
#' #'   # Here
#' # </logger>
#' @author Richèl J.C. Bilderbeek
#' @noRd
tree_prior_to_xml_tracelog <- function( # nolint beautier function
  tree_prior
) {
  testit::assert(is_tree_prior(tree_prior)) # nolint beautier function
  id <- tree_prior$id
  testit::assert(is_id(id)) # nolint beautier function

  text <- NULL
  if (is_yule_tree_prior(tree_prior)) { # nolint beautier function
    text <- c(text, paste0("<log idref=\"YuleModel.t:", id, "\"/>"))
    text <- c(text, paste0("<log idref=\"birthRate.t:", id, "\"/>"))
  } else if (is_bd_tree_prior(tree_prior)) { # nolint beautier function
    text <- c(text, paste0("<log idref=\"BirthDeath.t:", id, "\"/>"))
    text <- c(text, paste0("<log idref=\"BDBirthRate.t:", id, "\"/>"))
    text <- c(text, paste0("<log idref=\"BDDeathRate.t:", id, "\"/>"))
  } else if (is_ccp_tree_prior(tree_prior)) { # nolint beautier function
    text <- c(text, paste0("<log idref=\"popSize.t:", id, "\"/>"))
    text <- c(text, paste0("<log idref=\"CoalescentConstant.t:", id, "\"/>"))
  } else if (is_cbs_tree_prior(tree_prior)) { # nolint beautier function
    text <- c(text, paste0("<log idref=\"BayesianSkyline.t:", id, "\"/>"))
    text <- c(text, paste0("<log idref=\"bPopSizes.t:", id, "\"/>"))
    text <- c(text, paste0("<log idref=\"bGroupSizes.t:", id, "\"/>"))
  } else if (is_cep_tree_prior(tree_prior)) { # nolint beautier function
    text <- c(text, paste0("<log idref=\"CoalescentExponential.t:", id, "\"/>"))
    text <- c(text, paste0("<log idref=\"ePopSize.t:", id, "\"/>"))
    text <- c(text, paste0("<log idref=\"growthRate.t:", id, "\"/>"))
  }
  text
}
