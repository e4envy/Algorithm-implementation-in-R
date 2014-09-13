
#to calcualte daily duration
#param - kwhvalue, value of inblcluster,interval between two consecutive reading
daily_duration <- function(inblcluster,intervalduration){

  daily_inblduration <- length(inblcluster)*(intervalduration/60)
  return (daily_inblduration)
}

