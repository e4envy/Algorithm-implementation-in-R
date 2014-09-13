missing_duration = function(time){
  interval <- interval(time)
  count <- length(time)
  expected_count <- (24*60)/interval
  
  missing_points <- expected_count - count
  missing_duration <- missing_points * interval
  return(missing_duration) 
}
 