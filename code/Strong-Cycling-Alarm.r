

# calculate  DailyAbnormanlCycling = DailyCycling - WeekdayCyclingMean
daily_abnormal_cycling <- function(dailycycling, weekdaycyclingmean)
{
      daily_anormal_cycliingvalue <- dailycycling - weekdaycyclingmean
 return (daily_anormal_cycliingvalue)
}

# calculate DailyAbnormalCyclingPercentage = DailyAbnormalCycling/WeekDayCyclingmean
daily_abnormal_cycling_percentage <- function(dailyabnormalcycling,weekdaycyclingmean)
{
  daily_abnormal_cycling_percentagevalue <- dailyabnormalcycling/weekdaycyclingmean
  return(daily_abnormal_cycling_percentagevalue)
}

#calculate DailyAbnormalCyclingimpact = DailytotalBaseloadKwh - WeekdayBaseLoadTotalKWHMean
daily_abnormal_cycling_impact <- function(dailytotalbaseloadkwh,weekdaybaseloadtotalkwhmean)
{
  daily_abnormal_cycling_impactvalue <- dailytotalbaseloadkwh - weekdaybaseloadtotalkwhmean
  return(daily_abnormal_cycling_impactvalue)   
}



#daily_abnormal_cycling impact percentage value
daily_abnormal_cycling_impact_percentage <- function(dailyabnormalcyclingimpact,weekdaybaseloadtotalkwhmean)
{
   daily_abnormal_cycling_impact_percentagevalue <- dailyabnormalcyclingimpact/weekdaybaseloadtotalkwhmean
   return(daily_abnormal_cycling_impact_percentagevalue)
}