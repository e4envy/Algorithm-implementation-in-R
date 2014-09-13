context("Constant values")
  test_that("sensitivity factor", {
    expect_that(is.numeric(sensitivity_factor()), is_true())  
  })
 
  test_that("Minimum Baseload Factor", {
    expect_that(is.numeric(minimum_baseload_factor()), is_true())
  }) 