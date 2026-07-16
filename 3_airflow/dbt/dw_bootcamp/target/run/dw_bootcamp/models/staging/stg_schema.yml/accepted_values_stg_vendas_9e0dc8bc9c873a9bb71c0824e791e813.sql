
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        status_pedido as value_field,
        count(*) as n_records

    from "dbt_db"."public_staging"."stg_vendas"
    group by status_pedido

)

select *
from all_values
where value_field not in (
    'Cancelado','Faturado','Entregue'
)



  
  
      
    ) dbt_internal_test