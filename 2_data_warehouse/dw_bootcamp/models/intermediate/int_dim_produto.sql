{{
    config(
        materialized='table',
        unique_key='sk_produto',
        tags=['intermediate', 'dimension', 'produto']
    )
}}

with base_produto as (
	select 
		produto_id,
		produto,
		categoria,
		marca,
		fornecedor,
		centro_distribuicao,
		1 as prioridade
	from {{ ref('stg_estoque') }}
	
	UNION ALL
	
	select 
		produto_id,
		produto,
		categoria,
		marca,
		null as fornecedor,
		null as centro_distribuicao,
		2 as prioridade
	from {{ ref('stg_vendas') }}
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
    {{ dbt_utils.generate_surrogate_key(['produto_id']) }} as sk_produto,
    produto_id,
	produto,
	categoria,
	marca,
	fornecedor,
	centro_distribuicao,
    -- Metadados
    CURRENT_TIMESTAMP as dbt_update_at,
    '{{ run_started_at  }}' as dbt_loaded_at 
from tratamento
where rn = 1 