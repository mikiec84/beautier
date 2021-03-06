% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_tree_prior.R
\name{create_tree_prior}
\alias{create_tree_prior}
\title{Internal function to create a tree prior}
\usage{
create_tree_prior(name, id, ...)
}
\arguments{
\item{name}{the tree prior name. Can be any name
in \code{get_tree_prior_names}}

\item{id}{the ID of the alignment}

\item{...}{specific tree prior parameters}
}
\value{
a tree_prior
}
\description{
Internal function to create a tree prior
}
\note{
Prefer the use the named functions
  \code{\link{create_bd_tree_prior}},
  \code{\link{create_cbs_tree_prior}},
  \code{\link{create_ccp_tree_prior}}
  \code{\link{create_cep_tree_prior}}
  and \code{\link{create_yule_tree_prior}}
  instead
}
\examples{
  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_bd_tree_prior()
  )
  testit::assert(file.exists(beast2_input_file))

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_beautier_path("test_output_6.fas"),
    beast2_input_file,
    tree_prior = create_cbs_tree_prior()
  )
  testit::assert(file.exists(beast2_input_file))

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_ccp_tree_prior()
  )
  testit::assert(file.exists(beast2_input_file))

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_cep_tree_prior()
  )
  testit::assert(file.exists(beast2_input_file))

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_yule_tree_prior()
  )
  testit::assert(file.exists(beast2_input_file))
}
\seealso{
See
  \code{\link{create_bd_tree_prior}},
  \code{\link{create_cbs_tree_prior}},
  \code{\link{create_ccp_tree_prior}}
  \code{\link{create_cep_tree_prior}}
  and \code{\link{create_yule_tree_prior}}
  for more examples using those functions
}
\author{
Richèl J.C. Bilderbeek
}
