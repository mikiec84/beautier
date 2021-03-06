% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_tree_prior_from_name.R
\name{create_tree_prior_from_name}
\alias{create_tree_prior_from_name}
\title{Create a tree prior from name}
\usage{
create_tree_prior_from_name(tree_prior_name)
}
\arguments{
\item{tree_prior_name}{name of a tree prior,
must be a name as returned by \code{\link{get_tree_prior_names}}}
}
\value{
a tree prior
}
\description{
Create a tree prior from name
}
\examples{
  tree_prior_names <- get_tree_prior_names()
  for (tree_prior_name in tree_prior_names) {
    tree_prior <- create_tree_prior_from_name(tree_prior_name)
    testthat::expect_equal(tree_prior_name, tree_prior$name)
  }
}
\seealso{
Use \link{create_tree_prior} to create a tree prior
}
\author{
Richèl J.C. Bilderbeek
}
