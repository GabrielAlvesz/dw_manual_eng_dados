
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        estado as value_field,
        count(*) as n_records

    from "dbt_db"."public_staging"."stg_vendas"
    group by estado

)

select *
from all_values
where value_field not in (
    'AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO'
)



  
  
      
    ) dbt_internal_test