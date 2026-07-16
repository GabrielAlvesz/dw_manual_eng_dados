
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select estoque_atual
from "dbt_db"."public_staging"."stg_estoque"
where estoque_atual is null



  
  
      
    ) dbt_internal_test