# test_that("multiplication works", {
#   expect_equal(2 * 2, 4)
# })

test_that("lib_summary returns expected results with defaults", {
  result <- lib_summary() # call the object

  expect_s3_class(result, "data.frame") # expected class of the object
  expect_equal(ncol(result), 2) # test dimensions
  expect_gte(nrow(result), 1)
  expect_equal(names(result), c("Library", "n_packages")) # test names
  expect_type(result$n_packages, "integer") # test result value
  expect_type(result$Library, "character")
})

# Can modular tests using a helper file
  # Can fall into abstraction

test_that("sizes works", {
  result <- lib_summary(sizes = TRUE)

  expect_s3_class(result, "data.frame") # expected class of the object
  expect_equal(ncol(result), 3) # test dimensions
  expect_gte(nrow(result), 1)
  expect_equal(names(result), c("Library", "n_packages", "lib_size")) # test names
  expect_type(result$n_packages, "integer") # test result value
  expect_type(result$Library, "character")
  expect_type(result$lib_size, "double")
})

test_that("lib_summary fails appropriately", {
  expect_error(lib_summary("hello"), "must be logical") # expect an error
    # should contain the error text "unused argument"
})
