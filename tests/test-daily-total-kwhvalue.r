test_that("daily_total_kwh value is correctly calculted",{
  dailyblmean <- 4
  dailyduration <- 10
  expect_that(daily_total_kwh(dailyblmean,dailyduration) , equals(40))
})
