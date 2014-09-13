context("Check if constant value alarm should be raised")

test_that("returns true when all values are same and false when they are different", {
  expect_that(constant_values(c(1,1,1,1,1)), equals(T))
  expect_that(constant_values(c(2,1,4,"1")), equals(F))
})

