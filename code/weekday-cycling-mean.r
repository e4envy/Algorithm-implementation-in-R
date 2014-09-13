weekday_cycling_value <- function(historicaldata,weekday){
  
  historicaldata.df <- set_weekday(historicaldata)
  #print(oneMonthData)
  
  weekdaydata <- weekday_data(historicaldata.df,weekday)
  
  #split weekday data on date basis
  weekdaydata_list <- split_databydate(weekdaydata)
  j <- 0
  weekday_cycling_values <- c()
  
  total.days <- length(weekdaydata_list)
  
  for(i in 1:total.days)
  {
    oneDaylocalacquisitiontime <- unlist(lapply(weekdaydata_list[i], "[[", c("localacquisitiontime")))
    
    oneDayTime <- as.vector(oneDaylocalacquisitiontime)
    
    x <- length(oneDayTime)
    
    if(x > 0)
    {
      
      oneDayValue <- unlist(lapply(weekdaydata_list[i], "[[", c("value")))
      one_day_value <- as.vector(oneDayValue)
      
      daily_cycling_value <- daily_cycling(one_day_value)
      weekday_cycling_values <- c(weekday_cycling_values,daily_cycling_value)
      
      j <- j+1
    }
  }
  total_weekdays <- j
  
  #weekday_cycling_mean <- mean(weekday_cycling_values)
  
  return (weekday_cycling_values)
}


weekday_cycling_mean <- function(historicaldata,weekday)
{
  weekday_cycling <- weekday_cycling_value(historicaldata,weekday)
  mean_value <- mean(weekday_cycling)
  
  return( mean_value)
}

