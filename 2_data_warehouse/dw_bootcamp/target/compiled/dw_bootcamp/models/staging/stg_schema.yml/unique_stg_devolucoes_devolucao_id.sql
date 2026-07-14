
    
    

select
    devolucao_id as unique_field,
    count(*) as n_records

from "dbt_db"."public_staging"."stg_devolucoes"
where devolucao_id is not null
group by devolucao_id
having count(*) > 1


