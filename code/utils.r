utils_mean <- function(vector){
  return(mean(vector))
}


utils_mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}


is_whole_number <- function(number){
  is.wholenumber <- function(x, tol = .Machine$double.eps^0.5) {
      result <- tryCatch ({
      abs(x - round(x)) < tol
  }, error = function(e){
      return(F)
  })
    return(result)
  }
  return(is.wholenumber(number) && number >= 0)
}

utils_extract_date <- function(datetime) {
  date <- strsplit(datetime, "T")
  return(strsplit(datetime, "T")[[1]][1])
}

#http://r.789695.n4.nabble.com/remove-last-char-of-a-text-string-td2254377.html
utils_remove_last_character <- function(string) {
  return(gsub(".$", "", string))
}

utils_extract_time <- function(datetime) {
  onlytime <- strsplit(datetime, "T")
  onlytime <-lapply(onlytime, function(t) utils_remove_last_character(t[2]))
  onlytime <- unlist(onlytime)
  return(onlytime)
}
 
