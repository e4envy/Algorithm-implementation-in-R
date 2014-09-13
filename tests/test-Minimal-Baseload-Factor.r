context("kmean 3rd minimal baseload factor alarm calculation")
#generate test data
oneDayData <- read.csv("data-onedaydata.csv",header=TRUE)
oneMonthData <- read.csv("data-oneMonthData.csv",header=TRUE)

test_that("daily baseload factor is correctly calculated ", {
    expect_that(daily_baseload_factor(oneDayData$value) < 96, equals(T))
})






