-- models/dwh/dimensions/dim_satisfaction.sql

with source as (

    select *
    from {{ ref('stg_satisfaction') }}

)

select
    satisfaction_id,
    satisfaction_level
 

from source
