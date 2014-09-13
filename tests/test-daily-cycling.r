context("Calculate daily cycling")

test_that("Daily cycling is calculated correctly", {
  constant_data <- c(20, 20, 20, 20)
  expect_that(daily_cycling(constant_data), equals(0))
  
  normal_data <- c(10, 20, 4, 6)
  #should be 10+16+2
  expect_that(daily_cycling(normal_data), equals(28))
})