context("daily kwh value mean is ")

test_that("daily_mean value is correctly calculated", {
  kwhvalue <- c(3,4,5,6,7,8)
  expect_that(daily_mean(kwhvalue)  , equals(5.5))
})