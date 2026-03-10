-- models/dwh/dimensions/dim_performance.sql

with source as (

    select *
    from {{ ref('stg_performance_rating') }}

)

select
    performance_id,
employee_id,
review_date,
environment_satisfaction,
job_satisfaction,
relationship_satisfaction,
training_opportunities_within_year,
training_opportunities_taken,
work_life_balance,
self_rating,
manager_rating


from source
