
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select forma_pagamento
from "dbt_db"."public_staging"."stg_vendas"
where forma_pagamento is null



  
  
      
    ) dbt_internal_test