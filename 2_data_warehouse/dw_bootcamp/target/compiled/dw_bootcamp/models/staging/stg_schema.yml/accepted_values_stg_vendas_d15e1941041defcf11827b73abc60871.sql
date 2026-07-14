
    
    

with all_values as (

    select
        forma_pagamento as value_field,
        count(*) as n_records

    from "dbt_db"."public_staging"."stg_vendas"
    group by forma_pagamento

)

select *
from all_values
where value_field not in (
    'Boleto','Cartão de Crédito','Pix'
)


