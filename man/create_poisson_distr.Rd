% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_distr.R
\name{create_poisson_distr}
\alias{create_poisson_distr}
\alias{create_distr_poisson}
\title{Create a Poisson distribution}
\usage{
create_poisson_distr(id = NA, lambda = 0)
}
\arguments{
\item{id}{the distribution's ID}

\item{lambda}{the lambda parameter,
a numeric value.
For advanced usage, use the structure
as returned by \code{\link{create_lambda_param}}}
}
\value{
a Poisson distribution
}
\description{
Create a Poisson distribution
}
\examples{
  poisson_distr <- create_poisson_distr()

  beast2_input_file <- tempfile(fileext = ".xml")
  create_beast2_input_file(
    input_filename = get_fasta_filename(),
    beast2_input_file,
    tree_prior = create_yule_tree_prior(
      birth_rate_distr = poisson_distr
    )
  )
  testit::assert(file.exists(beast2_input_file))
}
\seealso{
the function \code{\link{create_distr}} shows an overview
  of all supported distributions
}
\author{
Richèl J.C. Bilderbeek
}
