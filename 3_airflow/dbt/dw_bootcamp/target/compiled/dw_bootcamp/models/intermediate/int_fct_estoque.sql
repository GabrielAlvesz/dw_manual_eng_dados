

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
    '2026-07-13 23:04:47.200613+00:00' as dbt_loaded_at
from "dbt_db"."public_staging"."stg_estoque" e

left join "dbt_db"."public_intermediate"."int_dim_produto" p
	on p.produto_id = e.produto_id