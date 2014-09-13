context("Weekday Index validation")
  test_that("Weekday index should be valid", {
    expect_that(validate_weekday_index("Monday"), throws_error("whole number")); 
    expect_that(validate_weekday_index(7), throws_error("between 0 and 6"));
  })
    

context("Weekday Mean is correctly obtained")
  test_that("Weekday mean is numeric", {
     expect_that(is.numeric(weekday_mean(0)), equals(T))
  })

context("Weekday SD is correctly obtained")
  test_that("Weekday SD is numeric", {
    expect_that(is.numeric(weekday_sd(0)), equals(T))
  })

context("Weekday TotalKWHMean is correctly obtained")
  test_that("Weekday TotalKWHMean is numeric", {
    expect_that(is.numeric(weekday_totalkwh_mean(0)), equals(T))
  })