

weekday_baseload_factor <- function(oneMonthData,weekday){
  oneMonthData$day <- setNames(0:6, c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))[weekdays(as.Date(oneMonthData$date))]
  oneMonthData.df <- data.frame(oneMonthData)
  #print(oneMonthData)
  oneMonthWeekDayData <- subset(oneMonthData.df,oneMonthData.df$day == weekday, SELECT = c(value,meterid,id,date,localacquisitiontime))
  
  oneMonthWeekDay_list <- split(oneMonthWeekDayData, as.factor(oneMonthWeekDayData$date))
  total.days <- length(oneMonthWeekDay_list)
  
  
  weekday_baseload_factor <- c()
  j <- 0
  
  for(i in 1:total.days)
  {
    oneDaylocalacquisitiontime <- unlist(lapply(oneMonthWeekDay_list[i], "[[", c("localacquisitiontime")))
    
    oneDayTime <- as.vector(oneDaylocalacquisitiontime)
    x <- length(oneDayTime)
    if(x > 0)
    {
      oneDaylocalacquisitiontime <- unlist(lapply(oneMonthWeekDay_list[i], "[[", c("localacquisitiontime")))
      oneDayTime <- as.vector(oneDaylocalacquisitiontime)
      interval <- interval(oneDayTime)
      oneDayValue <- unlist(lapply(oneMonthWeekDay_list[i], "[[", c("value")))
      one_day_value <- as.vector(oneDayValue)
      inblcluster <- kmean_inblcluster_values(one_day_value)
      daybaseloadfactor <- daily_baseload_factor(one_day_value)
      weekday_baseload_factor <- c(weekday_baseload_factor,daybaseloadfactor)
      j <- j+1
    }
  }
  total_weekdays <- j
  mean_value <- mean(weekday_baseload_factor)

  return( mean_value)
}  
