
  
    

  create  table "dbt_db"."public_intermediate"."int_fct_devolucao__dbt_tmp"
  
  
    as
  
  (
    

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
    '2026-07-12 16:22:42.642569+00:00' as dbt_loaded_at
from "dbt_db"."public_staging"."stg_devolucoes" d

left join "dbt_db"."public_intermediate"."int_dim_tempo" t
	on t.data_completa = d.data_devolucao
	
left join  "dbt_db"."public_intermediate"."int_dim_clientes" c
	on  c.cliente_id = d.cliente_id

left join  "dbt_db"."public_intermediate"."int_dim_produto" p
	on p.produto_id = d.produto_id
  );
  