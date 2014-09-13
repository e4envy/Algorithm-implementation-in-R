context("TEMP ---- Check if structure of sample csv is correct")
  test_that("CSV Structure", {
    daily_data <- read.csv2("data-for-r-bolt.csv", row.names=NULL)
    #print(daily_data$Value) 
  })
  