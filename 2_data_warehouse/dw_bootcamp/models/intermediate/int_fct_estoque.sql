{{
    config(
        materialized='table',
        unique_key='sk_produto',
        tags=['intermediate', 'fct', 'estoque']
    )
}}

select 
	p.sk_produto,
	e.estoque_inicial,
	e.entradas_periodo,
	e.estoque_atual,
	e.estoque_minimo,
	e.custo_unitario,
	e.centro_distribuicao,
    -- Metadados
    CURRENT_TIMESTAMP as dbt_update_at,
    '{{ run_started_at  }}' as dbt_loaded_at
from {{ ref('stg_estoque') }} e

left join {{ ref('int_dim_produto') }} p
	on p.produto_id = e.produto_id