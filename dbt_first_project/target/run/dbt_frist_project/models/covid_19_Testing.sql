
  create or replace   view DBT_WORKSPACE.DEV.covid_19_Testing
  
   as (
    with covid_19_model as (

    select * from DBT_WORKSPACE.DEV.stg_covid19_model

),

statewise_testing as (

    select * from DBT_WORKSPACE.DEV.stg_statewise_testing

),

final as (
    select
        covid_19_model.Covid_Day,
        covid_19_model.Date_occured,
        covid_19_model.Covid_Month,
        covid_19_model.Covid_Year,
        covid_19_model.Covid_States,
        covid_19_model.Cured,
        covid_19_model.Deaths,
        covid_19_model.Confirmed,
        statewise_testing.TestDay,
	    statewise_testing.Test_Date,
	    statewise_testing.Test_Month,
	    statewise_testing.Test_Year,
        statewise_testing.Test_States,
        statewise_testing.Test_TotalSamples,
        statewise_testing.Test_Negative,
        statewise_testing.Test_Positive
    from covid_19_model

    left join statewise_testing
        on covid_19_model.Covid_Day = statewise_testing.TestDay 
        and covid_19_model.Covid_Month = statewise_testing.Test_Month 
        and covid_19_model.Covid_Year = statewise_testing.Test_Year 
        and covid_19_model.Covid_States = statewise_testing.Test_States
)

select * from final
  );

