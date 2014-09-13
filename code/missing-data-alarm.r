missing_data_alarm <- function(time){
  if(missing_duration(time) >= 75){
    return(T)
  } else {
    return(F)
  }
}