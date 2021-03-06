% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_mcmc.R
\name{is_mcmc}
\alias{is_mcmc}
\title{Determine if the object is a valid MCMC}
\usage{
is_mcmc(x)
}
\arguments{
\item{x}{an object, to be determined if it is a valid MCMC}
}
\value{
TRUE if x is a valid MCMC, FALSE otherwise
}
\description{
Determine if the object is a valid MCMC
}
\examples{
  testthat::expect_true(is_mcmc(create_mcmc()))
  testthat::expect_true(is_mcmc(create_nested_sampling_mcmc()))
  testthat::expect_false(is_mcmc("nonsense"))
}
\seealso{
Use \code{\link{create_mcmc}} to create an MCMC
}
\author{
Richèl J.C. Bilderbeek
}
