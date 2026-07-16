{{
    config(
        materialized='table',
        tags=['mart', 'metricas']
    )
}}

with dim_tempo as (
    select *
    from {{ ref('int_dim_tempo') }}
),

fct_vendas as (
    select *
    from {{ ref('int_fct_vendas') }}
)

-- 01 - Faturamento por mês 
SELECT
    t.ano,
    t.mes,
    t.nome_mes,
    SUM(v.valor_total) AS faturamento
FROM dim_tempo t
LEFT JOIN fct_vendas v
    ON v.sk_tempo = t.sk_tempo
    
where v.status_pedido <> 'Cancelado'    

GROUP BY
    t.ano, t.mes, t.nome_mes
ORDER BY
    t.ano, t.mes