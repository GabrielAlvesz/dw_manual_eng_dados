{{
    config(
        materialized='table',
        unique_key='devolucao_id',
        tags=['intermediate', 'fct', 'devolucao']
    )
}}

select 
	d.devolucao_id,
	d.pedido_id,
	t.sk_tempo,
	c.sk_cliente,
	p.sk_produto,
	d.quantidade_devolvida,
	d.motivo_devolucao,
	d.status_devolucao,
	d.valor_devolvido,
    -- Metadados
    CURRENT_TIMESTAMP as dbt_update_at,
    '{{ run_started_at  }}' as dbt_loaded_at
from {{ ref('stg_devolucoes') }} d

left join {{ ref('int_dim_tempo') }} t
	on t.data_completa = d.data_devolucao
	
left join  {{ ref('int_dim_clientes') }} c
	on  c.cliente_id = d.cliente_id

left join  {{ ref('int_dim_produto') }} p
	on p.produto_id = d.produto_id