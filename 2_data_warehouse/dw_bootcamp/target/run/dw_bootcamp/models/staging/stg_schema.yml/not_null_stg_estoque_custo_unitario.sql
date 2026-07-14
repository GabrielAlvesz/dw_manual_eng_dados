
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select custo_unitario
from "dbt_db"."public_staging"."stg_estoque"
where custo_unitario is null



  
  
      
    ) dbt_internal_test