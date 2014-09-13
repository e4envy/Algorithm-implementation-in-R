test_that("daily-abnormal-cycling value is correctly calculated",{
      dailycycling <- 10
      weekdaycyclingmean <- 9
 expect_that(daily_abnormal_cycling(dailycycling,weekdaycyclingmean), equals(1))  
})


test_that("daily-abnormal-cycling-percentage value is correctly calculated",{
  dailyabnormalcycling <- 5
  weekdaycyclingmean <- 10
  expect_that(daily_abnormal_cycling_percentage(dailyabnormalcycling,weekdaycyclingmean),equals(.5))
})


test_that("daily-abnormal-cycling-impact",{
         dailytotalkwhvalue <- 10
         weekdaybaseloadtotalkwhmean <- 9
  expect_that(daily_abnormal_cycling_impact(dailytotalkwhvalue,weekdaybaseloadtotalkwhmean),equals(1))
    
})


test_that("daily-abnormal-cycling-impact-percentage",{
        dailyabnormalcyclingimpact <- 10
        weekdaybaseloadtotalkwhmean <- 20
        expect_that(daily_abnormal_cycling_impact_percentage(dailyabnormalcyclingimpact,weekdaybaseloadtotalkwhmean),equals(0.5))
})

