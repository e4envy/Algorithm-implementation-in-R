#test data 
historicaldata <- read.csv("data-oneMonthData.csv",header=TRUE)


#weekdaybl_total_kwhmean 
test_that("weekday total kwh mean is correctly ",{
  expect_that(weekdaybl_total_kwhmean(historicaldata,2) > 96 , equals(T))
})