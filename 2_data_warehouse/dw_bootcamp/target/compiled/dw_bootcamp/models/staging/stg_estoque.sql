-- CTE "source": seleciona todas as colunas do seed (dados brutos)
with source as (
    select
        "produto_id",
        "produto",
        "categoria",
        "marca",
        "fornecedor",
        "estoque_inicial",
        "entradas_periodo",
        "estoque_atual",
        "estoque_minimo",
        "custo_unitario",
        "centro_distribuicao"
    from "dbt_db"."public"."desafio2_estoque"
),

typed as (
    select
        cast("produto_id" as integer) as produto_id,

        cast("produto"    as text) as produto,
        cast("categoria"  as text) as categoria,
        cast("marca"      as text) as marca,
        cast("fornecedor" as text) as fornecedor,

        cast("estoque_inicial"  as integer) as estoque_inicial,
        cast("entradas_periodo" as integer) as entradas_periodo,
        cast("estoque_atual"    as integer) as estoque_atual,
        cast("estoque_minimo"   as integer) as estoque_minimo,

        cast("custo_unitario" as numeric) as custo_unitario,

        cast("centro_distribuicao" as text) as centro_distribuicao

    from source
)

select * from typed