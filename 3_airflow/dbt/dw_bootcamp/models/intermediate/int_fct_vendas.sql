{{
    config(
        materialized='table',
        unique_key='pedido_id',
        tags=['intermediate', 'fct', 'vendas']
    )
}}

SELECT
    v.pedido_id,
    c.sk_cliente,
    t.sk_tempo,
    p.sk_produto,
    cv.sk_canal_venda,
    fp.sk_forma_pagamento,
    l.sk_localidade,
    v.quantidade,
    v.preco_unitario,
    v.desconto,
    v.frete,
    v.valor_total,
    v.status_pedido,
    -- Metadados
    CURRENT_TIMESTAMP as dbt_update_at,
    '{{ run_started_at  }}' as dbt_loaded_at
FROM {{ ref('stg_vendas') }} v

LEFT JOIN {{ ref('int_dim_tempo') }} t
    ON t.data_completa = v.data_pedido
    
left join {{ ref('int_dim_clientes') }} c
	on c.cliente_id = v.cliente_id 
	
left join {{ ref('int_dim_produto') }} p
	on p.produto_id = v.produto_id 
	
left join {{ ref('int_dim_canal_venda') }} cv
	on cv.canal_venda = v.canal_venda
	
left join {{ ref('int_dim_forma_pagamento') }} fp
	on fp.forma_pagamento = v.forma_pagamento 
    
left join {{ ref('int_dim_localidade') }} l
	on l.cidade = v.cidade
	and l.estado = v.estado