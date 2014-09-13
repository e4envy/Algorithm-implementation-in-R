validate_weekday_index = function(weekday_index){
  if(!is_whole_number(weekday_index)){
    stop("Weekday Index should be a whole number")
  }
  
  if(weekday_index > 6){
    stop("Weekday Index should be a number between 0 and 6 where 0 represents Monday")
  } 
}

weekday_mean = function(weekday_index){
  validate_weekday_index(weekday_index) 
  return(25)
}

weekday_totalkwh_mean = function(weekday_index){
  validate_weekday_index(weekday_index)
  return(10245)
}


weekday_sd = function(weekday_index){
  validate_weekday_index(weekday_index)
  return(0.8) 
}

