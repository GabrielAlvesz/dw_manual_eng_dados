
    
    

with all_values as (

    select
        status_devolucao as value_field,
        count(*) as n_records

    from "dbt_db"."public_staging"."stg_devolucoes"
    group by status_devolucao

)

select *
from all_values
where value_field not in (
    'Concluída','Em análise'
)


