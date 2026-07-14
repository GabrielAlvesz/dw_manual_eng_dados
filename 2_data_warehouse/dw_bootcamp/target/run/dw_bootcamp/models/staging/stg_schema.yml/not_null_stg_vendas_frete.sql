
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select frete
from "dbt_db"."public_staging"."stg_vendas"
where frete is null



  
  
      
    ) dbt_internal_test