daily_total_kwh <- function(dailyblmean, dailyduration) 
{
  daily_total_kwhvalue <- dailyblmean*dailyduration

  return (daily_total_kwhvalue)
}