
  
    

  create  table "dbt_db"."public_intermediate"."int_dim_produto__dbt_tmp"
  
  
    as
  
  (
    

with base_produto as (
	select 
		produto_id,
		produto,
		categoria,
		marca,
		fornecedor,
		centro_distribuicao,
		1 as prioridade
	from "dbt_db"."public_staging"."stg_estoque"
	
	UNION ALL
	
	select 
		produto_id,
		produto,
		categoria,
		marca,
		null as fornecedor,
		null as centro_distribuicao,
		2 as prioridade
	from "dbt_db"."public_staging"."stg_vendas"
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
    '2026-07-12 16:22:42.642569+00:00' as dbt_loaded_at 
from tratamento
where rn = 1
  );
  