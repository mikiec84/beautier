#' Create a BEAST2 XML input text
#' @param input_fasta_filenames One or more fasta filename
#' @param site_models one or more site models,
#'   as returned by 'create_site_models'
#' @param mcmc_chainlength Length of MCMC chain
#' @param tree_priors On or more tree priors,
#'   as returned by 'create_tree_prior'
#' @param output_xml_filename Name of the XML parameter file created by this
#'   function. BEAST2 uses this file as input.
#' @param fixed_crown_age determines if the phylogeny its crown age is
#'   fixed. If FALSE, crown age is estimated by BEAST2. If TRUE,
#'   the crown age is fixed to the crown age
#'   of the initial phylogeny.
#' @param initial_phylogeny the MCMC chain its initial phylogeny. If
#'   this is set to NA, BEAST2 will use a random phylogeny. Else
#'   a phylogeny must be supplied of class ape::phylo.
#' @examples
#'   # Get the filename of an example FASTA file
#'   input_fasta_filename <- get_input_fasta_filename()
#'   testit::assert(file.exists(input_fasta_filename))
#'
#'   # The file created by beastscriptr, a BEAST2 input file
#'   output_xml_filename <- "example_bd.xml"
#'
#'   # Birth-Death tree prior, crown age is estimated
#'   xml <- create_beast2_input(
#'     input_fasta_filenames = get_input_fasta_filename(),
#'     site_models = create_site_model(name = "JC69"),
#'     mcmc_chainlength = 10000000,
#'     tree_priors = create_tree_prior(name = "birth_death"),
#'     output_xml_filename = output_xml_filename
#'   )
#' @author Richel Bilderbeek
#' @export
create_beast2_input <- function(
  input_fasta_filenames,
  site_models = create_site_model(name = "JC69"),
  mcmc_chainlength,
  tree_priors = create_tree_prior(name = "birth_death"),
  output_xml_filename,
  fixed_crown_age = FALSE,
  initial_phylogeny = NA
) {
  if (!file.exists(input_fasta_filenames)) {
    stop("input_fasta_filenames not found")
  }
  if (!is_site_model(site_models)) {
    stop("invalid site_model")
  }
  if (!is_tree_prior(tree_priors)) {
    stop("invalid tree_prior")
  }
  if (mcmc_chainlength <= 0) {
    stop("mcmc_chainlength must be positive")
  }
  if (!is.logical(fixed_crown_age)) {
    stop("fixed_crown_age must be either TRUE or FALSE")
  }

  # Make a million show as 1000000 instead of 1e+06
  options(scipen = 20)

  text <- NULL
  text <- c(text, beastscriptr::create_beast2_input_xml())
  text <- c(
    text,
    create_beast2_input_beast(
      input_fasta_filenames = input_fasta_filenames,
      mcmc_chainlength = mcmc_chainlength,
      tree_priors = tree_priors,
      fixed_crown_age = fixed_crown_age,
      initial_phylogeny = initial_phylogeny
    )
  )
  text
}