#daily_abnormal_baseload_factor  = DailyBaseLoadFactor - WeekDayBaseloadFactor
daily_abnormal_baseload_factor <- function(dailybaseloadfactor,weekdaybaseloadfactor)
{
    dailyabnormalbaseloadfactor <- dailybaseloadfactor - weekdaybaseloadfactor
    return(dailyabnormalbaseloadfactor)
}
 
#daily_abnormal_baseload_factor_percentage = DailyBaseLoadFactor/WeekDayBaseloadFactor
daily_abnormal_baseload_factor_percentage <- function(dailybaseloadfactor,weekdaybaseloadfactor)
{
  dailyabnormalbaseloadfactor <- dailybaseloadfactor/weekdaybaseloadfactor
  return(dailyabnormalbaseloadfactor)
}
 

#dailybl_impact_percentage
dailybl_impact_percentage <- function(dailyblmeankwh,weekdaybltotalkwhmean){
      dailyblimpactpercentage <- (dailyblmeankwh- weekdaybltotalkwhmean)/weekdaybltotalkwhmean
      rerturn(dailyblimpactpercentage)
}




