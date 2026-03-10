-- models/dwh/facts/fact_attrition.sql

with employee as (

    select *
    from `hr_analytics`.`dim_employee1`

),

performance as (

    select *
    from `hr_analytics`.`dim_performance`

)



select
    e.employee_id,
    p.performance_id,

    -- Measures
    e.attrition_flag,
    e.age,
    e.years_at_company,
    e.years_with_manager,
    e.years_since_last_promotion,
    e.distance_from_home,

    p.environment_satisfaction,
    p.job_satisfaction,
    p.work_life_balance,
    p.manager_rating,
    p.self_rating

from employee e
left join performance p
    on e.employee_id = p.employee_id