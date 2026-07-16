
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select categoria
from "dbt_db"."public_staging"."stg_estoque"
where categoria is null



  
  
      
    ) dbt_internal_test