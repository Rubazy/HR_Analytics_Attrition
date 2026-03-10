with source as (
    select *
    from `hr_analytics`.`stg_employee`
)

select 
 employee_id,


    age,
    gender,
    marital_status,
    education_field,


    department,
    job_role,
    business_travel,
    distance_from_home_km,
    years_at_company,
    years_with_manager,
    years_since_last_promotion,

    -- Attrition flag (dimension attribute)
     attrition

from source