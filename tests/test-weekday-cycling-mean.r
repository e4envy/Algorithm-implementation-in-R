
#testdata used
date <- c("2012-03-05","2012-03-06","2012-03-06","2012-03-06","2012-03-06","2012-03-13","2012-03-13","2012-03-13","2012-03-13")
day <- c(1,2,2,2,2,2,2,2,2)
value <- c(3,4,5,6,7,10,20,30,40)
localacquisitiontime <- c("00:00:00","00:00:00","06:00:00","12:00:00","18:00:00", "00:00:00","06:00:00","12:00:00","18:00:00")

historicaldata <- data.frame(date,day,value,localacquisitiontime)

test_that("weekday-cycling-values is correctly calculated",{
  
  wcv <- weekday_cycling_value(historicaldata,2)
  expect_that(wcv[1],equals(3))
  expect_that(wcv[2],equals(30))
})


test_that("weekday-cycling-mean is correctly calculated",{
  #weekday_cycling_mean value is 
  # according to 
  # daily_cycling_value      date  
  #   3                      2012-03-06
  #   30                      2012-03-13
  # weeday_cycling_mean (3+30)/2 equals to 16.5
  
  expect_that(weekday_cycling_mean(historicaldata,2), equals(16.5))

})


