context("are_mrca_taxa_non_intersecting")

test_that("use, intersection, monophyly", {

  fasta_filename <- get_beautier_path("test_output_5.fas")
  all_taxa_names <- get_taxa_names(fasta_filename)

  prior_one_two <- create_mrca_prior(
    alignment_id = get_alignment_id(fasta_filename),
    taxa_names = all_taxa_names[1:2],
    is_monophyletic = TRUE
  )
  prior_two_three <- create_mrca_prior(
    alignment_id = get_alignment_id(fasta_filename),
    taxa_names = all_taxa_names[2:3],
    is_monophyletic = TRUE
  )
  prior_three_four <- create_mrca_prior(
    alignment_id = get_alignment_id(fasta_filename),
    taxa_names = all_taxa_names[3:4],
    is_monophyletic = TRUE
  )
  intersecting_priors <- list(prior_one_two, prior_two_three)
  non_intersecting_priors <- list(prior_one_two, prior_three_four)

  testthat::expect_true(
    beautier:::are_mrca_taxa_non_intersecting(
      non_intersecting_priors
    )
  )

  testthat::expect_false(
    beautier:::are_mrca_taxa_non_intersecting(
      intersecting_priors
    )
  )

})

test_that("use, intersection, non-monophyletic", {

  fasta_filename <- get_beautier_path("test_output_5.fas")
  all_taxa_names <- get_taxa_names(fasta_filename)

  prior_one_two <- create_mrca_prior(
    alignment_id = get_alignment_id(fasta_filename),
    taxa_names = all_taxa_names[1:2],
    is_monophyletic = FALSE
  )
  prior_two_three <- create_mrca_prior(
    alignment_id = get_alignment_id(fasta_filename),
    taxa_names = all_taxa_names[2:3],
    is_monophyletic = FALSE
  )
  # Would the priors be monophyletic, they would have an intersection
  non_intersecting_priors <- list(prior_one_two, prior_two_three)
  testthat::expect_true(
    beautier:::are_mrca_taxa_non_intersecting(
      non_intersecting_priors
    )
  )
})

test_that("use, subset", {

  fasta_filename <- get_beautier_path("test_output_5.fas")
  all_taxa_names <- get_taxa_names(fasta_filename)

  prior_one_two_three <- create_mrca_prior(
    alignment_id = get_alignment_id(fasta_filename),
    taxa_names = all_taxa_names[1:3],
    is_monophyletic = TRUE
  )
  prior_two_three <- create_mrca_prior(
    alignment_id = get_alignment_id(fasta_filename),
    taxa_names = all_taxa_names[2:3],
    is_monophyletic = TRUE
  )
  non_intersecting_priors <- list(prior_one_two_three, prior_two_three)

  testthat::expect_true(
    beautier:::are_mrca_taxa_non_intersecting(
      non_intersecting_priors
    )
  )

})