
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select centro_distribuicao
from "dbt_db"."public_staging"."stg_estoque"
where centro_distribuicao is null



  
  
      
    ) dbt_internal_test