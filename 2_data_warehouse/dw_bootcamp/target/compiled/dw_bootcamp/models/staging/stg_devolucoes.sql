-- CTE "source": seleciona todas as colunas do seed (dados brutos)
with source as (
    select
        "devolucao_id",
        "pedido_id",
        "data_devolucao",
        "cliente_id",
        "produto_id",
        "quantidade_devolvida",
        "valor_devolvido",
        "motivo_devolucao",
        "status_devolucao"
    from "dbt_db"."public"."desafio2_devolucoes"
),

typed as (
    select
        cast("devolucao_id" as integer) as devolucao_id,
        cast("pedido_id"    as integer) as pedido_id,

        cast("data_devolucao" as date) as data_devolucao,

        cast("cliente_id" as integer) as cliente_id,
        cast("produto_id" as integer) as produto_id,

        cast("quantidade_devolvida" as integer) as quantidade_devolvida,
        cast("valor_devolvido"      as numeric) as valor_devolvido,

        TRIM(cast("motivo_devolucao" as text)) as motivo_devolucao,
        TRIM(cast("status_devolucao" as text)) as status_devolucao

    from source
)

select * from typed