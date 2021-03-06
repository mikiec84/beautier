context("test-check_site_model")

test_that("use", {
  expect_silent(check_site_model(create_jc69_site_model()))
  expect_silent(check_site_model(create_hky_site_model()))
  expect_silent(check_site_model(create_tn93_site_model()))
  expect_silent(check_site_model(create_gtr_site_model()))

  # Can use lists
  expect_silent(check_site_model(list(create_jc69_site_model())))

  # Must be one site model
  expect_error(
    check_site_model(list(create_jc69_site_model(), create_jc69_site_model())),
    "'site_model' must be a valid site model"
  )

  # Must be a site model
  expect_error(
    check_site_model("nonsense"),
    "'site_model' must be a valid site model"
  )
  expect_error(
    check_site_model(NULL),
    "'site_model' must be a valid site model"
  )
  expect_error(
    check_site_model(NA),
    "'site_model' must be a valid site model"
  )
})
