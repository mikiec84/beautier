context("create_beast2_input_tracelog")

test_that("use", {
  created <- create_beast2_input_tracelog(ids = 1)
  expected <- c(
    "<logger id=\"tracelog\" fileName=\"1.log\" logEvery=\"1000\" model=\"@posterior\" sanitiseHeaders=\"true\" sort=\"smart\">", # nolint
    "    <log idref=\"posterior\"/>",
    "    <log idref=\"likelihood\"/>",
    "    <log idref=\"prior\"/>",
    "    <log idref=\"treeLikelihood.1\"/>",
    "    <log id=\"TreeHeight.t:1\" spec=\"beast.evolution.tree.TreeHeightLogger\" tree=\"@Tree.t:1\"/>", # nolint
    "    <log idref=\"YuleModel.t:1\"/>",
    "    <log idref=\"birthRate.t:1\"/>",
    "</logger>"
  )
  expect_equal(created, expected)
})
