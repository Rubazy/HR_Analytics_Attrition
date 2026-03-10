
  create view `hr_analytics`.`fact_attrition__dbt_tmp`
    
    
  as (
    -- models/dwh/facts/fact_attrition.sql

with employee as (
    select *
    from `hr_analytics`.`dim_employee`
),

performance as (
    select *
    from `hr_analytics`.`dim_performance`
),

final as (

    select
        e.employee_id,
        p.performance_id,

        -- Measures
        e.attrition,
        e.age,
        e.years_at_company,
        e.years_with_manager,
        e.years_since_last_promotion,
        e.distance_from_home_km,

        case 
            when e.business_travel = 'Travel_Rarely' then 1
            when e.business_travel = 'Travel_Frequently' then 2
            else 0
        end as business_travel_code,

        -- Performance metrics
        p.environment_satisfaction,
        p.job_satisfaction,
        p.relationship_satisfaction,
        p.work_life_balance,
        p.training_opportunities_within_year,
        p.training_opportunities_taken,
        p.self_rating,
        p.manager_rating

    from employee e
    left join performance p
        on e.employee_id = p.employee_id
)

select
    row_number() over (order by employee_id) as fact_id,

    employee_id,
    performance_id,
    attrition,
    age,
    years_at_company,
    years_with_manager,
    years_since_last_promotion,
    distance_from_home_km,
    business_travel_code,
    environment_satisfaction,
    job_satisfaction,
    relationship_satisfaction,
    work_life_balance,
    training_opportunities_within_year,
    training_opportunities_taken,
    self_rating,
    manager_rating

from final
  );