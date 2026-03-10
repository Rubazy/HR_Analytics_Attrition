
  create view `hr_analytics`.`stg_satisfaction__dbt_tmp`
    
    
  as (
    -- models/staging/stg_satisfaction.sql

with source as (

    select *
    from `hr_analytics`.`satisfiedlevel_raw`

),

cleaned as (

    select
        SatisfactionID as satisfaction_id,

        -- Capitalize first word, second word lowercase
        concat(
            upper(left(SatisfactionLevel, 1)),
            lower(substring(SatisfactionLevel, 2))
        ) as satisfaction_level

    from source
    where SatisfactionID is not null
      and SatisfactionLevel is not null

)

select *
from cleaned
  );