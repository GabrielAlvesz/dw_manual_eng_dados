{{
    config(
        materialized='table',
        unique_key='sk_cliente',
        tags=['intermediate', 'dimension', 'cliente']
    )
}}

    WITH base_cliente AS (

        SELECT DISTINCT cliente_id
        FROM {{ ref('stg_vendas') }}

        UNION

        SELECT DISTINCT cliente_id
        FROM {{ ref('stg_devolucoes') }}

    )

    SELECT
        -- Chave (SK)
        {{ dbt_utils.generate_surrogate_key(['cliente_id']) }} as sk_cliente,

        cliente_id,

        -- Metadados
        CURRENT_TIMESTAMP as dbt_update_at,
        '{{ run_started_at  }}' as dbt_loaded_at 

    FROM base_cliente


