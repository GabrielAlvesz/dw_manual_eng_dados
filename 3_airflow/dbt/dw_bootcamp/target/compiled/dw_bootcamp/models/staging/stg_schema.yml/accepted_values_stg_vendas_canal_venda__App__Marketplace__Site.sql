
    
    

with all_values as (

    select
        canal_venda as value_field,
        count(*) as n_records

    from "dbt_db"."public_staging"."stg_vendas"
    group by canal_venda

)

select *
from all_values
where value_field not in (
    'App','Marketplace','Site'
)


