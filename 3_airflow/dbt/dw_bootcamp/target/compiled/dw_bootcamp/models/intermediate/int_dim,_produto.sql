

with base_produto as (
	select 
		produto_id,
		produto,
		categoria,
		marca,
		fornecedor,
		centro_distribuicao,
		1 as prioridade
	from "dbt_db"."public"."stg_estoque"
	
	UNION ALL
	
	select 
		produto_id,
		produto,
		categoria,
		marca,
		null as fornecedor,
		null as centro_distribuicao,
		2 as prioridade
	from "dbt_db"."public"."stg_vendas"
),

tratamento as (
	select 
		produto_id,
		produto,
		categoria,
		marca,
		fornecedor,
		centro_distribuicao,
		ROW_NUMBER() OVER (
	                PARTITION BY produto_id
	                ORDER BY prioridade
	            ) AS rn
	from base_produto
)

SELECT
    -- Chave (SK)
    md5(cast(coalesce(cast(produto_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as sk_produto,
    produto_id,
	produto,
	categoria,
	marca,
	fornecedor,
	centro_distribuicao,
    -- Metadados
    CURRENT_TIMESTAMP as dbt_update_at,
    '2026-07-11 15:07:51.969048+00:00' as dbt_loaded_at 
from tratamento
where rn = 1