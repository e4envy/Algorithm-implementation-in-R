baseload_duration_alarm_raised <- function(one_day_data, weekday_duration_mean, weekday_duration_sd, sensitivity_factor){
  values <- one_day_data$values
  time <- one_day_data$localacquisitiontime
  
  weekday_duration_mean <- 12
  weekday_duration_sd <- 2
  
  if(daily_baseload_factor(values) < minimum_baseload_factor()) {
    return(F)
  }
  
  inblcluster <- kmean_inblcluster_values(values)
  interval <- interval(time)
  
  daily_duration <- daily_duration(inblcluster, interval)
}


baseload_factor_too_low <- function(daily_baseload_factor, minimum_baseload_factor){
  if(daily_baseload_factor < minimum_baseload_factor) {
    return(T)
  } else {
    return(F)
  }
}

baseload_duration_too_low <- function(daily_duration, weekday_duration_mean, weekday_duration_sd, sensitivity_factor) {
  if(daily_duration < weekday_duration_mean - (weekday_duration_sd * sensitivity_factor)){
    return(T)
  } else {
    return(F)
  }
}

daily_blmean_kwh <- function(inblcluster)
{
     daily_blmean_kwhvalue <- mean(inblcluster)
     #print("dailyblmeankwhvalue is")
     #print(daily_blmean_kwhvalue)
     return (daily_blmean_kwhvalue)
}




#DailyAbnormalDuration equals to WeekDayDurationMean - DailyDuration
# param weekday duration mean minus daily duration
daily_abnormal_duration <- function(weekdaydurationmean,dailyduration)
{
     daily_abnormal_durationvalue <- weekdaydurationmean - dailyduration
     #print("dailyabnormaldurationvalue")
     #print(daily_abnormal_durationvalue)
     return (daily_abnormal_durationvalue)
}

#DailyAbnormalDurationPercentage = DailyAbnormalDuration/WeekDayDurationMeand
#param
daily_abnormal_duration_percentage <- function(dailyabnormalduration,weekdaydurationmean)
{
   daily_abnormal_duration_percentage_value <- dailyabnormalduration/weekdaydurationmean
   #print("dailyabnormaldurationpercentagevalue")
   #print(daily_abnormal_duration_percentage_value)
   return (daily_abnormal_duration_percentage_value)
}

#DailyAbnormalDurationKWH = DailyAbnormalDuration*DailyBLmeanKWH
daily_abnormal_duration_kwh <- function(dailyabnormalduration,dailyblmeankwh)
{
    daily_abnormal_duration_kwhvalue <- dailyabnormalduration*dailyblmeankwh
    #print("dailyabnormaldurationkwhvalue")
    #print(daily_abnormal_duration_kwhvalue)
    return (daily_abnormal_duration_kwhvalue)
}

# DailyAbnormalDurationImpact <- DailyAbnormalDurationKWH/DailyTotalKWH
daily_abnormal_duration_impact <- function(dailyabnormaldurationkwh,dailytotalkwh)
{     
    dailyabnormaldurationimpact <- dailyabnormaldurationkwh/dailytotalkwh
    #print("dailyabnormaldurationimpact")
    #print(dailyabnormaldurationimpact)
    return (dailyabnormaldurationimpact)
}


