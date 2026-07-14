
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select status_devolucao
from "dbt_db"."public_staging"."stg_devolucoes"
where status_devolucao is null



  
  
      
    ) dbt_internal_test