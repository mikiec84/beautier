#' Creates the distribution section in the prior section of the
#' distribution section of a BEAST2 XML parameter file.
#'
#' These lines start with '<distribution id='
#' @inheritParams default_params_doc
#' @return lines of XML text
#' @author Richèl J.C. Bilderbeek
#' @examples
#'  # <distribution id="posterior" spec="util.CompoundDistribution">
#'  #     <distribution id="prior" spec="util.CompoundDistribution">
#'  #       HERE, where the ID of the distribution is 'prior'
#'  #     </distribution>
#'  #     <distribution id="likelihood" ...>
#'  #     </distribution>
#'  # </distribution>
#' @noRd
tree_prior_to_xml_prior_distr <- function( # nolint beautier function
  tree_prior
) {
  testit::assert(is_tree_prior(tree_prior)) # nolint beautier function
  text <- NULL
  if (is_bd_tree_prior(tree_prior)) { # nolint beautier function
    text <- c(text, bd_tree_prior_to_xml_prior_distr(tree_prior)) # nolint beautier function
  } else if (is_cbs_tree_prior(tree_prior)) { # nolint beautier function
    text <- c(text, cbs_tree_prior_to_xml_prior_distr(tree_prior)) # nolint beautier function
  } else if (is_ccp_tree_prior(tree_prior)) { # nolint beautier function
    text <- c(text, ccp_tree_prior_to_xml_prior_distr(tree_prior)) # nolint beautier function
  } else if (is_cep_tree_prior(tree_prior)) { # nolint beautier function
    text <- c(text, cep_tree_prior_to_xml_prior_distr(tree_prior)) # nolint beautier function
  } else {
    testit::assert(is_yule_tree_prior(tree_prior)) # nolint beautier function
    text <- c(text, yule_tree_prior_to_xml_prior_distr(tree_prior)) # nolint beautier function
  }
  text
}
