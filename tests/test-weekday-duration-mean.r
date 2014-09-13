context("weekday duration mean ")
oneMonthData <- read.csv("data-oneMonthData.csv",header=TRUE)



test_that("set weekday is calculatd on date basis ", {
  date <- c("2012-03-06","2012-03-05")
  oneDayData <- data.frame(date)
  
  
  data_with_weekdays <- set_weekday(oneDayData)
  #print(data_with_weekdays)
  #print("Value")
  #print(as.numeric(data_with_weekdays$day[1]))
  expect_that(as.numeric(data_with_weekdays$day[2]), equals(1))
  expect_that(as.numeric(data_with_weekdays$day[1]), equals(2)) 

})



test_that("get weekday data on weekday basis ", {
  date <- c("2012-03-06","2012-03-05","2012-03-06")
  day <- c(2,1,2)
  DaysData <- data.frame(date,day)
  #print("Days Data")
  #print(DaysData)
  expect_that(weekday_data(DaysData,2)$day[1],equals(2))
  expect_that(weekday_data(DaysData,2)$day[2],equals(2))
})

#test weekday_data by weekday value from all data
test_that("weekday_duration values for ",{
   date <- c("2012-03-05","2012-03-06","2012-03-06","2012-03-13","2012-03-13")
   day <- c(1,2,2,2,2)
   value <- c(3,4,5,10,20)
   DaysData <- data.frame(date,day,value)
   wd <- weekday_data(DaysData,2)
   
   expect_that(wd$day[1],equals(2))
   expect_that(wd$day[2],equals(2))
   expect_that(wd$day[3],equals(2))
   expect_that(wd$day[4],equals(2))
   
})

#test weekday_duration mean is 
test_that("weekday_duration mean is ",{
  date <- c("2012-03-05","2012-03-06","2012-03-06","2012-03-06","2012-03-06","2012-03-13","2012-03-13","2012-03-13","2012-03-13")
  day <- c(1,2,2,2,2,2,2,2,2)
  value <- c(3,4,5,6,7,10,20,30,40)
  localacquisitiontime <- c("00:00:00","00:00:00","06:00:00","12:00:00","18:00:00", "00:00:00","06:00:00","12:00:00","18:00:00")
 
   daysdata <- data.frame(date,day,value,localacquisitiontime)
   wd <- weekday_data(daysdata,2)
   weekday_data_list <- split_databydate(wd)
  
   weekday_duration <- weekday_duration_values(weekday_data_list)
  
   #date                   weekday_duration_value       
   #2012-03-06             0.2
   #2012-03-13             0.2
   #so weekday duration mean should be equal to 0.2
   #interval is 6 so daily duration is 2*(6/60)
   wdm <- weekday_duration_mean(daysdata,2)
   expect_that(wdm, equals(0.2) )
   
  
})




test_that("test weekday duration standerd deviation ",{
  weekdaydurationvalues <- c(3,3,3,3)
  expect_that(weekday_duration_sd(weekdaydurationvalues), equals(0))
})


