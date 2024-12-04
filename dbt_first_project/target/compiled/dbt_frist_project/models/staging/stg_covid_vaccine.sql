with allcolumn as (

    select * from "DBT_WORKSPACE"."DEV"."RAW_COVID_VACCINE_STATEWISE"
),

cast_column as (
    select 
    CAST(SNO AS INTEGER) AS SNO,
    CAST(UPDATED_ON AS DATE) AS UPDATED_ON,
    CAST(MONTH AS VARCHAR) AS MONTH,
    CAST(YEAR AS INTEGER) AS YEAR,
    CAST(STATE AS VARCHAR) AS STATE,
    CAST(TOTAL_DOSES_ADMINISTERED AS INTEGER) AS TOTAL_DOSES_ADMINISTERED,
    CAST(First_Dose_Administered AS INTEGER) AS First_Dose_Administered,
    CAST(SECOND_DOSE_ADMINISTERED AS INTEGER) AS SECOND_DOSE_ADMINISTERED,
    CAST(MALE_DOSES_ADMINISTERED AS INTEGER) AS MALE_DOSES_ADMINISTERED,
    CAST(FEMALE_DOSES_ADMINISTERED AS INTEGER) AS FEMALE_DOSES_ADMINISTERED,
    CAST(TRANSGENDER_DOSES_ADMINISTERED AS INTEGER) AS TRANSGENDER_DOSES_ADMINISTERED,
    CAST(COVAXIN_DOSES_ADMINISTERED AS INTEGER) AS COVAXIN_DOSES_ADMINISTERED,
    CAST(COVISHIELD_DOSES_ADMINISTERED AS INTEGER) AS COVISHIELD_DOSES_ADMINISTERED,
    CAST(SPUTNIK_V_DOSESADMINISTERED AS INTEGER) AS SPUTNIK_V_DOSESADMINISTERED,
    CAST(YEARS_18TO44_DOSES_ADMINISTERED AS INTEGER) AS YEARS_18TO44_DOSES_ADMINISTERED,
    CAST(YEARS_45TO60_DOSES_ADMINISTERED AS INTEGER) AS YEARS_45TO60_DOSES_ADMINISTERED,
    CAST(YEARS_60_PLUS_DOSESADMINISTERED AS INTEGER) AS YEARS_60_PLUS_DOSESADMINISTERED,
    CAST(TOTAL_INDIVIDUALS_VACCINATED AS INTEGER) AS TOTAL_INDIVIDUALS_VACCINATED
    from allcolumn
),

Final as (
                        select
                        Sno as Vaccine_Day,
                        month as Vaccine_Month,
                        year as Vaccine_Year,
                        State as Vaccine_States,	
                        TOTAL_DOSES_ADMINISTERED as Total_doses,
                        First_Dose_Administered as First_Dose,
                        SECOND_DOSE_ADMINISTERED as Second_Dose,
                        MALE_DOSES_ADMINISTERED as Male_Dose,
                        FEMALE_DOSES_ADMINISTERED as Female_Dose,
                        TRANSGENDER_DOSES_ADMINISTERED as Transgender_Dose,
                        COVAXIN_DOSES_ADMINISTERED as Covaxin_dose,
                        COVISHIELD_DOSES_ADMINISTERED as CoviShield_dose,
                        SPUTNIK_V_DOSESADMINISTERED as Sputnik_V,
                        YEARS_18TO44_DOSES_ADMINISTERED as Years18_44,
                        YEARS_45TO60_DOSES_ADMINISTERED as Years45_60,
                        YEARS_60_PLUS_DOSESADMINISTERED as Years60_Plus,
                        TOTAL_INDIVIDUALS_VACCINATED as Total_Vaccinated
                        from cast_column
                        where Vaccine_Day is not null and Vaccine_Month is not null and Vaccine_Year is not null and Vaccine_States is not null
)

select * from Final