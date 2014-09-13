

#test_data
#historicaldata <- read.csv("data-oneMonthData.csv",header=TRUE)


test_that("weekday baseload factor is correctly calculated",{
 
  date <- c("2012-03-05","2012-03-06","2012-03-06","2012-03-06","2012-03-06","2012-03-13","2012-03-13","2012-03-13","2012-03-13")
  day <- c(1,2,2,2,2,2,2,2,2)
  value <- c(20,40,60,80,120,200,400,500,700)
  localacquisitiontime <- c("00:00:00","00:00:00","06:00:00","12:00:00","18:00:00", "00:00:00","06:00:00","12:00:00","18:00:00")
  historicaldata <- data.frame(date,day,value,localacquisitiontime)
  wbf <- weekday_baseload_factor(historicaldata,2)
  
  # baseload factor for 
  # date                 baseload_factor
  # 2012-03-06            2   (Daily CL2/Daily CL1)=(100/50)=2
  # 2012-03-13            2   (Daily CL2/Daily CL1)=(600/300)=2
  #weekday_baseload_factor <- mean(2,2)  = 2
  expect_that(wbf ,equals(2))
})