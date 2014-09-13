

# set weekday such as sunday =0, Monday = 1, and so on
set_weekday <- function(oneMonthData){
  oneMonthData$day <- setNames(0:6, c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))[weekdays(as.Date(oneMonthData$date))]
  oneMonthData.df <- data.frame(oneMonthData)
  return(oneMonthData.df)
}


# subset data on weekday basis
weekday_data <- function(data_with_weekday_value,weekday)
{
  WeekDayData <- subset(data_with_weekday_value,data_with_weekday_value$day == weekday, SELECT = c(value,meterid,id,date,localacquisitiontime))
  return (WeekDayData)
}

# get vector of weekday_duration 
weekday_duration_values <- function(weekdaydata_list)
{
  j <- 0
  weekday_durationvalue <- c()
  
  total.days <- length(weekdaydata_list)
  
  for(i in 1:total.days)
  {
    oneDaylocalacquisitiontime <- unlist(lapply(weekdaydata_list[i], "[[", c("localacquisitiontime")))
    
    oneDayTime <- as.vector(oneDaylocalacquisitiontime)
    x <- length(oneDayTime)
    if(x > 0)
    {
      oneDaylocalacquisitiontime <- unlist(lapply(weekdaydata_list[i], "[[", c("localacquisitiontime")))
      
      oneDayTime <- as.vector(oneDaylocalacquisitiontime)
      
      interval <- interval(oneDayTime)
      #print(interval)
      
      oneDayValue <- unlist(lapply(weekdaydata_list[i], "[[", c("value")))
      one_day_value <- as.vector(oneDayValue)
      
      inblcluster <- kmean_inblcluster_values(one_day_value)
      oneDayDuration <- daily_duration(inblcluster,interval)
     
      weekday_durationvalue <- c(weekday_durationvalue,oneDayDuration)
      
      j <- j+1
    }
  }
  total_weekdays <- j
  
  return (weekday_durationvalue)
}

#@fn split data by date 
#@return A list each element of list contain one day data
#@param  data of more than one days
split_databydate <- function(daysdata){
  data_list <- split(daysdata, as.factor(daysdata$date))
  return(data_list)
}

weekday_duration_sd <- function(weekdaydurationvalues)
{
  wsd <- sd(weekdaydurationvalues)
  return (wsd)
}

#weekday duration mean for last monday that is calculated
weekday_duration_mean <- function(oneMonthData,weekday)
{
  oneMonthData.df <- set_weekday(oneMonthData)
  #print(oneMonthData)
  
  weekdaydata <- weekday_data(oneMonthData.df,weekday)
  
  #split weekday data on date basis
  weekdaydata_list <- split_databydate(weekdaydata)
  
  weekday_duration <- weekday_duration_values(weekdaydata_list)
  
  mean_value <- mean(weekday_duration)

  sd_value <- weekday_duration_sd(weekday_duration)
  
  return( mean_value)
}
