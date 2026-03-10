
  create view `hr_analytics`.`dim_satisfaction__dbt_tmp`
    
    
  as (
    -- models/dwh/dimensions/dim_satisfaction.sql

with source as (

    select *
    from `hr_analytics`.`stg_satisfaction`

)

select
    satisfaction_id,
    satisfaction_level
 

from source
  );