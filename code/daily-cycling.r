daily_cycling <- function(values){

  diffs <- diff(values)
  
  abs_diffs <- abs(diffs)
  sum_diffs <- sum(abs_diffs)
  return(sum_diffs)
}