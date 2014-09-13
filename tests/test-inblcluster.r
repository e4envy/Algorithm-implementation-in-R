context(" inblcluster kwh value")

test_that("in bl cluster value cluster vector for oneDayData",{
  kwh_value <- c(3,4,5,6,7,8)
  expect_that(kmean_inblcluster_values(kwh_value)  , equals(c(3,4,5)))
})
