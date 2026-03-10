-- models/staging/stg_ratinglevel.sql

with source as (

    select *
    from `hr_analytics`.`ratinglevel_raw`

),

cleaned as (

    select
        RatingID as rating_id,

        -- Capitalize first word, second word lowercase
        concat(
            upper(left(RatingLevel, 1)),
            lower(substring(RatingLevel, 2))
        ) as rating_level

    from source
    where RatingID is not null
      and RatingLevel is not null

)

select *
from cleaned