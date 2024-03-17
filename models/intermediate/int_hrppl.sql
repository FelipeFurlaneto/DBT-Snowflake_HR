{{ config(materialized='table') }}

with int_hr as
(
    select
        CITY as City
        ,FIRST_NAME || ' ' || LAST_NAME as Full_Name
        ,GENDER as Gender
        ,ID as ID
        ,JSON_EXTRACT_PATH_TEXT(JOB, 'salary') as annual_salary_usd
        ,JSON_EXTRACT_PATH_TEXT(JOB, 'title') as role_title
        ,JSON_EXTRACT_PATH_TEXT(PREV_COMPANY, '[0]') as last_company_at
        ,ARRAY_SIZE(PARSE_JSON(PREV_COMPANY)) as qty_prev_companies
        ,ARRAY_SIZE(PARSE_JSON(SPOKEN_LANGUAGES)) as qty_langs_spoken
    from {{ ref('stg_hrppl') }}
    group by 1, 2, 3, 4, 5, 6, 7, 8, 9
)

select * from int_hr