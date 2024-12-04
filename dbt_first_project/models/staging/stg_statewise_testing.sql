with raw_statewise as (

    select * from "DBT_WORKSPACE"."DEV"."RAW_STATEWISETESTINGDETAILS"
),

cast_column as (
    select 
    CAST(DAYS AS INTEGER) AS DAYS,
    DATE,
    CAST(MONTH AS VARCHAR) AS MONTH,
    CAST(YEAR AS INTEGER) AS YEAR,
    CAST(STATE AS VARCHAR) AS STATE,
    CAST(TOTALSAMPLES AS INTEGER) AS TOTALSAMPLES,
    CAST(NEGATIVE AS INTEGER) AS NEGATIVE,
    CAST(POSITIVE AS INTEGER) AS POSITIVE
    from raw_statewise
),

final as (
            select 
            DAYS as TestDay,
	        DATE as Test_Date,
	        MONTH as Test_Month,
	        YEAR as Test_Year,
            STATE as Test_States,
            TOTALSAMPLES as Test_TotalSamples,
            NEGATIVE as Test_Negative,
            POSITIVE as Test_Positive
            from cast_column
            where TestDay is not null and Test_Month is not null and Test_Year is not null and Test_States is not null
)

select * from final