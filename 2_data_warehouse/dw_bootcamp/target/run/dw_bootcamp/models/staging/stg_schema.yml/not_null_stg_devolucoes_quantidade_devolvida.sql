
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select quantidade_devolvida
from "dbt_db"."public_staging"."stg_devolucoes"
where quantidade_devolvida is null



  
  
      
    ) dbt_internal_test