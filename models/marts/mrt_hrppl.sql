{{ config(materialized='table') }}

with mrt_hr as
(
    select * from {{ ref('int_hrppl') }}
)

select * from mrt_hr

/* as project doesn't require aggregations 
(OBT since begging), mart layer is the same as intermediate*/