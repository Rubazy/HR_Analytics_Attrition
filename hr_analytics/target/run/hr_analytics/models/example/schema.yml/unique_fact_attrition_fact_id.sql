select
      count(*) as failures,
      case
        when count(*) <> 0 then 'true'
        else 'false'
      end as should_warn,
      case
        when count(*) <> 0 then 'true'
        else 'false'
      end as should_error
    from (
      
    
    

select
    fact_id as unique_field,
    count(*) as n_records

from `hr_analytics`.`fact_attrition`
where fact_id is not null
group by fact_id
having count(*) > 1



      
    ) dbt_internal_test