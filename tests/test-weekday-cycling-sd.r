test_that("weekday standerd devivation is correctly calculated",{
  
  weekday_cycling_values <- c(4,4)
  expect_that(weekday_cycling_sd(weekday_cycling_values),equals(0))
})