context("Baseload Duration Alarm tests")
#generate test data
oneDayData <- read.csv("data-onedaydata.csv",header=TRUE)
oneMonthData <- read.csv("data-oneMonthData.csv",header=TRUE)
#oneDayData
#oneMonthData

#  function need to call test another function
#intervalduration <- interval(oneDayData$localacquisitiontime)
#inblcluster <- kmean_inblcluster_values(oneDayData$value)
#weekdaydurationmean <- weekday_duration_mean(oneMonthData,1)
#dailyduration <- daily_duration(oneDayData$value,inblcluster,intervalduration)
## for now weekdaydurationmean we  are calculating for monday
#weekdaydurationmean <- weekday_duration_mean(oneMonthData,2)
#dailyabnormalduration <- daily_abnormal_duration(weekdaydurationmean,dailyduration)
#dailyblmean <- daily_blmean_kwh(inblcluster)
#dailyabnormaldurationkwh <- daily_abnormal_duration_kwh(dailyabnormalduration,dailyblmean)
#dailytotalkwh <- daily_total_kwh(oneDayData,dailyblmean,dailyduration)

test_that("Baseload Duration alarm is raised for sample data", {
  values <- c(1,2,3,4,5,6)
  time <- c("00:00:00", "04:00:00", "08:00:00", "12:00:00", "16:00:00", "20:00:00")
  
  #Daily baseload factor for the above data is 2.5
  dbf <- daily_baseload_factor(values)
  
  
})


test_that("Baseload Duration alarm is not raised if Baseload Factor is less than threshold", {
  expect_that(baseload_factor_too_low(daily_baseload_factor=1.2, minimum_baseload_factor=1.3), equals(T))
  expect_that(baseload_factor_too_low(daily_baseload_factor=1.4, minimum_baseload_factor=1.3), equals(F))
})


test_that("Baseload Duration alarm is raised baeload duration is too low", {
  #expect_that(baseload_duration_too_low(daily_duration=10, weekday_duration_mean=12, weekday_duration_sd=1, sensitivity_factor=2), equals(T))
  #expect_that(baseload_duration_too_low(daily_duration=10, weekday_duration_mean=12, weekday_duration_sd=1, sensitivity_factor=2), equals(F))
})



test_that("Baseload duration alarm fires", {
  #oneDayData <- list(values=c(10, 10, 14, 14))
  #expect_that(baseload_duration_alarm_raised(oneDayData), equals(T))
})
 
test_that("Baseload Duration Alarm is raised", {
  #daily_baseload_factor <- 1.2
  
 # if(dailyduration > weekdaydurationmean - (weekdaydurationsd * sensitivity_factor)) {
 #   return(T)
 # } else {
#    
 # }
  
})



test_that("DailyBLMean kwh value is correctly calculated",{
  inblvalue <- c(3,4,5)
    expect_that(daily_blmean_kwh(inblvalue) , equals(4))
})



test_that("daily_ abnormal duration kwh value is correctly calculated",{
     weekdaydurationmean <- 7
     dailyduration <- 4
     expect_that(daily_abnormal_duration(weekdaydurationmean,dailyduration)  ,equals(3))
})


test_that("daily_abnormal duration percentage is correctly calculated",{
      dailyabnormalduration <- 3
      weekdaydurationmean <- 4
      expect_that(daily_abnormal_duration_percentage(abs(dailyabnormalduration),weekdaydurationmean), equals(0.75))
})


test_that("daily_abnormal_duration_kwhvalue is correctly calculated",{
    dailyabnormalduration <- 3
    dailyblmean <- 10
    expect_that(abs(daily_abnormal_duration_kwh(dailyabnormalduration,dailyblmean))  , equals(30))
})


test_that("daily_abnormal_duration_impact is correctly calculated ", {
  dailyabnormaldurationkwh <- 40
  dailytotalkwh <- 4
  expect_that(abs(daily_abnormal_duration_impact(dailyabnormaldurationkwh,dailytotalkwh)), equals(10))  
})
