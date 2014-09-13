context("Baseload Factor Caclulation")

test_that("daily baseload factor is correctly calculated ", {
  oneDayDataValues <- c(1,2,3,4,5,6)
  dbf <- daily_baseload_factor(oneDayDataValues)
  expect_that(dbf, equals(2.5))
})