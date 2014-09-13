context("Tests for utility functions")
  test_that("Mode calculation", {
    expect_that(utils_mode(c(1,1,2)), equals(1))
    expect_that(utils_mode(c("1", "1", 2)), equals("1"))
  })

  test_that("Is whole number", {
    expect_that(is_whole_number(0), equals(T))
    expect_that(is_whole_number(1), equals(T))
    expect_that(is_whole_number(1.2), equals(F))
    expect_that(is_whole_number(-1), equals(F)) 
    expect_that(is_whole_number("Hello"), equals(F))
  })

  test_that("Mean", {
    expect_that(utils_mean(c(1,2,3)), equals(2))
  }) 


  test_that("Date is extracted correctly from datetime", {
    expect_that(utils_extract_date("2014-06-10T01:50:00Z"), equals("2014-06-10"))
  })

  test_that("Time is extracted correctly from datetime", {
    onlytime <- utils_extract_time(c("2014-06-10T01:40:00Z", "2014-06-10T01:50:00Z"))

    expect_that(onlytime[1], equals("01:40:00"))
    expect_that(onlytime[2], equals("01:50:00")) 
  })