daily_baseload_factor <- function(oneDayData){
  cluster_centers <- kmean_center_calculation(oneDayData)
  dailybaseloadfactor <- cluster_centers[2]/cluster_centers[1]
  return(dailybaseloadfactor)
}