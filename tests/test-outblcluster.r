test_that("out bl cluster value cluster vector for oneDayData",{
  kwh_value <- c(3,4,5,6,7,8)
  expect_that(kmean_outblcluster_values(kwh_value) , equals(c(6,7,8)))
})
