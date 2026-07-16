
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        canal_venda as value_field,
        count(*) as n_records

    from "dbt_db"."public_staging"."stg_vendas"
    group by canal_venda

)

select *
from all_values
where value_field not in (
    'App','Marketplace','Site'
)



  
  
      
    ) dbt_internal_test