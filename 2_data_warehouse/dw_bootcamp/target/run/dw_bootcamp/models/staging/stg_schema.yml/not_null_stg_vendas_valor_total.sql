
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select valor_total
from "dbt_db"."public_staging"."stg_vendas"
where valor_total is null



  
  
      
    ) dbt_internal_test