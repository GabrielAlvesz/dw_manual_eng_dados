
  
    

  create  table "dbt_db"."public_intermediate"."int_fct_vendas__dbt_tmp"
  
  
    as
  
  (
    

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
    '2026-07-12 16:22:42.642569+00:00' as dbt_loaded_at
FROM "dbt_db"."public_staging"."stg_vendas" v

LEFT JOIN "dbt_db"."public_intermediate"."int_dim_tempo" t
    ON t.data_completa = v.data_pedido
    
left join "dbt_db"."public_intermediate"."int_dim_clientes" c
	on c.cliente_id = v.cliente_id 
	
left join "dbt_db"."public_intermediate"."int_dim_produto" p
	on p.produto_id = v.produto_id 
	
left join "dbt_db"."public_intermediate"."int_dim_canal_venda" cv
	on cv.canal_venda = v.canal_venda
	
left join "dbt_db"."public_intermediate"."int_dim_forma_pagamento" fp
	on fp.forma_pagamento = v.forma_pagamento 
    
left join "dbt_db"."public_intermediate"."int_dim_localidade" l
	on l.cidade = v.cidade
	and l.estado = v.estado
  );
  