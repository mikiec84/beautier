context("are_ids")

test_that("use", {

  testthat::expect_true(are_ids("anthus_aco"))
  testthat::expect_true(are_ids(c("anthus_aco", "anthus_nd2")))
  testthat::expect_false(are_ids(c(1, 2)))
  testthat::expect_false(are_ids(1))
  testthat::expect_false(are_ids(NULL))
  testthat::expect_false(are_ids(NA))
  testthat::expect_false(are_ids(c()))

})