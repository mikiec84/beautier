#' Determine if MRCA priors that are monophyletic (i.e., assume
#' no other taxons share a same MRCA) are compatible, that
#' is, there are no taxa that intersect. For example, one
#' MRCA prior with taxon 1 and 2 is incompatible with an MRCA prior
#' with taxon 3 and 4
#' @inheritParams default_params_doc
#' @author Richel J.C. Bilderbeek
are_mrca_taxa_non_intersecting <- function(mrca_priors) {
  testit::assert(are_mrca_priors(mrca_priors))
  if (is_one_na(mrca_priors)) return(TRUE)
  for (mrca_prior_1 in mrca_priors) {
    testit::assert(is_mrca_prior(mrca_prior_1))
    testit::assert(!is_one_na(mrca_prior_1))
    if (!mrca_prior_1$is_monophyletic) next
    taxa_names_1 <- mrca_prior_1$taxa_names
    for (mrca_prior_2 in mrca_priors) {
      testit::assert(is_mrca_prior(mrca_prior_2))
      testit::assert(!is_one_na(mrca_prior_2))
      if (!mrca_prior_2$is_monophyletic) next
      taxa_names_2 <- mrca_prior_2$taxa_names
      diff <- setdiff(x = taxa_names_1, y = taxa_names_2)
      if (length(diff) == 0) next
      if (diff != taxa_names_1 && diff != taxa_names_2) {
        return(FALSE)
      }
    }
  }
  TRUE
}