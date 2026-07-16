
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select cidade
from "dbt_db"."public_staging"."stg_vendas"
where cidade is null



  
  
      
    ) dbt_internal_test