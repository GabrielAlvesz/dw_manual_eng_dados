
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select produto
from "dbt_db"."public_staging"."stg_vendas"
where produto is null



  
  
      
    ) dbt_internal_test