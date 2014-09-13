context("Integration test for constant value alarm")
  test_that("Constant value alarm is raised", {
    data <- get_data_from_previous_bolt()
    
    #Data required to check if alarm is raised
    dm = 15
    wdm = 11
    wdsd = 0.5
    sf = 2
    
    
    #Data required to get values to put in report
    dtkwh = 300
    wdtkwh = 200                                    
    
    constant_value_alarm_raised = raises_constant_value_alarm(daily_mean = dm,
                                weekday_mean = wdm,
                                weekday_sd = wdsd,
                                sensitivity_factor = sf)
    
    if(constant_value_alarm_raised){
        #Calculate alarm parameters to be put in the report
       params <- constant_alarm_report_parameters(daily_mean = dm, 
                                       weekday_mean = wdm, 
                                       daily_totalkwh = dtkwh, 
                                       weekday_totalkwh_mean = wdtkwh) 
    }
  }) 
