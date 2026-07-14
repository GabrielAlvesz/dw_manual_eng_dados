
    
    

select
    pedido_id as unique_field,
    count(*) as n_records

from "dbt_db"."public_staging"."stg_vendas"
where pedido_id is not null
group by pedido_id
having count(*) > 1


