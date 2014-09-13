context("kmean- cluster centers-calculation for one day kwh value") 
test_that("kmean for one daydata", {
  kwhvalues <- c(2,3,4,5,6,7)
  centers <- kmean_center_calculation(kwhvalues)
  expect_that(length(centers),equals(2))
  expect_that(centers[1] < centers[2], equals(T))
  expect_that(centers[1],equals(3))
  expect_that(centers[2],equals(6))
})
