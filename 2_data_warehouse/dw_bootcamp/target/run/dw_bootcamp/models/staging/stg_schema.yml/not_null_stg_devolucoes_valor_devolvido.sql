
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select valor_devolvido
from "dbt_db"."public_staging"."stg_devolucoes"
where valor_devolvido is null



  
  
      
    ) dbt_internal_test