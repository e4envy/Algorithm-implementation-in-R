#WeekDayBLtotalKwhMean is 
weekdaybl_total_kwhmean <- function(historicaldata,weekday){
  
  historicaldata$day <- setNames(0:6, c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))[weekdays(as.Date(historicaldata$date))]
  historicaldata.df <- data.frame(historicaldata)
  #print(oneMonthData)
  historicalweekdaydata <- subset(historicaldata.df,historicaldata.df$day == weekday, SELECT = c(value,meterid,id,date,localacquisitiontime))
  
  weekdays_list <- split(historicalweekdaydata, as.factor(historicalweekdaydata$date))
  total.days <- length(weekdays_list)
  
  
  weekdaybltotalkwhmean <- c()
  j <- 0
  
  for(i in 1:total.days)
  {
    oneDaylocalacquisitiontime <- unlist(lapply(weekdays_list[i], "[[", c("localacquisitiontime")))
    
    oneDayTime <- as.vector(oneDaylocalacquisitiontime)
    x <- length(oneDayTime)
    if(x > 0)
    {
      oneDaylocalacquisitiontime <- unlist(lapply(weekdays_list[i], "[[", c("localacquisitiontime")))
      oneDayTime <- as.vector(oneDaylocalacquisitiontime)
      interval <- interval(oneDayTime)
      oneDayValue <- unlist(lapply(weekdays_list[i], "[[", c("value")))
      one_day_value <- as.vector(oneDayValue)
      
      inblcluster <- kmean_inblcluster_values(one_day_value)
      dailyblmean <- daily_blmean_kwh(inblcluster)
      
      intervalduration <- interval(oneDaylocalacquisitiontime)
      dailyduration <- daily_duration(inblcluster,intervalduration)
      daytotalkwh <- daily_total_kwh(dailyblmean,dailyduration)
      
      weekdaybltotalkwhmean <- c(weekdaybltotalkwhmean,daytotalkwh)
      j <- j+1
    }
  }
  total_weekdays <- j
  mean_value <- mean(weekdaybltotalkwhmean)  
  return( mean_value)  
  
}
