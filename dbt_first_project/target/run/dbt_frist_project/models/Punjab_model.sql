
  create or replace   view DBT_WORKSPACE.DEV.Punjab_model
  
   as (
    with covid_19_model_1 as (

    select * from DBT_WORKSPACE.DEV.stg_covid19_model

),

covid_vaccine as (

    select * from DBT_WORKSPACE.DEV.stg_covid_vaccine

),

covid_19_model as (
    Select * from covid_19_model_1 where Covid_States = 'Punjab'
),

final as (

    select
        covid_19_model.Covid_Day,
        covid_19_model.Date_occured,
        covid_19_model.Covid_Month,
        covid_19_model.Covid_Year,
        covid_19_model.Covid_States,
        covid_19_model.Cured,
        covid_vaccine.Total_doses,
        covid_vaccine.First_Dose,
        covid_vaccine.Second_Dose,
        covid_vaccine.Male_Dose,
        covid_vaccine.Female_Dose,
        covid_vaccine.Transgender_Dose,
        covid_vaccine.Covaxin_dose,
        covid_vaccine.CoviShield_dose,
        covid_vaccine.Sputnik_V
    from covid_19_model

    left join covid_vaccine
        on covid_19_model.Covid_Day = covid_vaccine.Vaccine_Day 
        and covid_19_model.Covid_Month = covid_vaccine.Vaccine_Month 
        and covid_19_model.Covid_Year = covid_vaccine.Vaccine_Year 
        and covid_19_model.Covid_States = covid_vaccine.Vaccine_States
)

select * from final
  );

