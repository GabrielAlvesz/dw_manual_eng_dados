
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select canal_venda
from "dbt_db"."public_staging"."stg_vendas"
where canal_venda is null



  
  
      
    ) dbt_internal_test