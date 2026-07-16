-- CTE "source": seleciona todas as colunas do seed (dados brutos)
with source as (
    select
        "pedido_id",
        "data_pedido",
        "cliente_id",
        "produto_id",
        "produto",
        "categoria",
        "marca",
        "quantidade",
        "preco_unitario",
        "desconto",
        "frete",
        "valor_total",
        "canal_venda",
        "forma_pagamento",
        "cidade",
        "estado",
        "status_pedido"
    from {{ ref('desafio2_vendas') }}
),

typed as (
    select
        cast("pedido_id" as integer) as pedido_id,

        cast("data_pedido" as date) as data_pedido,

        cast("cliente_id" as integer) as cliente_id,
        cast("produto_id" as integer) as produto_id,

        TRIM(cast("produto"   as text)) as produto,
        TRIM(cast("categoria" as text)) as categoria,
        TRIM(cast("marca"     as text)) as marca,

        cast("quantidade" as integer) as quantidade,

        cast("preco_unitario" as numeric) as preco_unitario,
        cast("desconto"       as numeric) as desconto,
        cast("frete"          as numeric) as frete,
        cast("valor_total"    as numeric) as valor_total,

        cast("canal_venda"     as text) as canal_venda,
        cast("forma_pagamento" as text) as forma_pagamento,

        cast("cidade" as text) as cidade,
        trim(upper("estado"::text)) as estado,

        cast("status_pedido" as text) as status_pedido

    from source
)

select * from typed