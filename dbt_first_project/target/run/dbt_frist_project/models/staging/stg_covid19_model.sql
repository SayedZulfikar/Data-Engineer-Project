
  create or replace   view DBT_WORKSPACE.DEV.stg_covid19_model
  
   as (
    with covid_case as (

    select * from "DBT_WORKSPACE"."DEV"."RAW_COVID_19_INDIA"
),

all_column as (
    select 
    CAST(SNO AS INTEGER) AS SNO,
    DATE,
    CAST(MONTH AS VARCHAR) AS MONTH,
    CAST(YEAR AS INTEGER) AS YEAR,
    CAST(TIME AS TIME) AS TIME,
    CAST(STATE_UNIONTERRITORY AS VARCHAR) AS STATE_UNIONTERRITORY,
    CAST(CONFIRMEDINDIANNATIONAL AS INTEGER) AS CONFIRMEDINDIANNATIONAL,
    CAST(CONFIRMEDFOREIGNNATIONAL AS INTEGER) AS CONFIRMEDFOREIGNNATIONAL,
    CAST(CURED AS INTEGER) AS CURED,
    CAST(DEATHS AS INTEGER) AS DEATHS,
    CAST(CONFIRMED AS INTEGER) AS CONFIRMED
    from covid_case
),


covid_case_rename as (
    select 
        Sno as Covid_Day,
        Date as Date_occured,
        month as Covid_Month,
        year as Covid_Year,
        STATE_UNIONTERRITORY as Covid_States,
        COALESCE(CONFIRMEDINDIANNATIONAL, 0) AS CONFIRMEDINDIANNATIONAL,
        COALESCE(CONFIRMEDFOREIGNNATIONAL, 0) AS CONFIRMEDFOREIGNNATIONAL,
        Cured,
        Deaths,
        Confirmed
    from all_column

),

Final as (
    select 
        Covid_Day,
        Date_occured,
        Covid_Month,
        Covid_Year,
        Covid_States,
        Cured,
        Deaths,
        Confirmed
    from covid_case_rename 
        where Covid_Day is not null and Covid_Month is not null and Covid_Year is not null and Covid_States is not null
)

select * from Final
  );

