context("Calculate the interval duration for one day data")
test_that("Interval duration is correctly calculated", {
  zero_data = c()
  #expect_that(interval(zero_data), throws_error())

  invalid_data = c("12-10-50", "23-10-21");
  expect_that(interval(invalid_data), throws_error())
  
  data_fifteen = read.csv2("data-interval.csv")
  expect_that(interval(data_fifteen$localacquisitiontime), equals(15))
  
})
