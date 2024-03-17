{{ config(materialize='view') }}

with stg_hr as
(
select * from HR_AND_PEOPLE.dbo.hr
)