
    
    

select
    satisfaction_id as unique_field,
    count(*) as n_records

from `hr_analytics`.`dim_satisfaction`
where satisfaction_id is not null
group by satisfaction_id
having count(*) > 1


