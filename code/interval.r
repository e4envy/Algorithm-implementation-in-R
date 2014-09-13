interval <- function(time)
{
  interval = tryCatch({
    #http://www.inside-r.org/r-doc/base/strftime
    time <- strptime(time, '%H:%M:%S')
  
    if(any(is.na(time)) == TRUE) {
      #http://stackoverflow.com/questions/1608130/equivalent-of-throw-in-r
      stop("Data is incorrect")
    }
    #http://stackoverflow.com/questions/12977073/how-to-find-the-difference-between-two-dates-in-hours-in-r  
    #interval <- difftime(time[2], time[1], units="mins")
    
    #http://stackoverflow.com/questions/8404611/how-to-find-the-difference-in-value-in-every-two-consecutive-rows-in-r
    utils_mode(diff(time))
  }, warning = function(w) {
      #print(w)
      return(null)
  }, error = function(e) {
      #print(e)
      return(null)
  }, finally = {
  })
  return(interval)
}

