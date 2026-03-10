with source as (

    select *
    from `hr_analytics`.`performancerating_raw`


)
select PerformanceID as performance_id,
EmployeeID as employee_id,
DATE_FORMAT(ReviewDate, '%Y/%m/%d') AS review_date,
     cast(EnvironmentSatisfaction as signed)          as environment_satisfaction,
        cast(JobSatisfaction as signed)                  as job_satisfaction,
        cast(RelationshipSatisfaction as signed)        as relationship_satisfaction,
        cast(TrainingOpportunitiesWithinYear as signed) as training_opportunities_within_year,
        cast(TrainingOpportunitiesTaken as signed)      as training_opportunities_taken,
        cast(WorkLifeBalance as signed)                 as work_life_balance,
        cast(SelfRating as signed)                      as self_rating,
        cast(ManagerRating as signed)                   as manager_rating

    from source
    where PerformanceID is not null
      and EmployeeID is not null