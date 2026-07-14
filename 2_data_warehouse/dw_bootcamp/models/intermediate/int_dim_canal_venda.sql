{{
    config(
        materialized='table',
        unique_key='sk_canal_venda',
        tags=['intermediate', 'dimension', 'canal_venda']
    )
}}

    WITH base_canal_venda AS (

        SELECT DISTINCT canal_venda
        FROM {{ ref('stg_vendas') }}

    )

    SELECT
        -- Chave (SK)
        {{ dbt_utils.generate_surrogate_key(['canal_venda']) }} as sk_canal_venda,

        canal_venda,

        -- Metadados
        CURRENT_TIMESTAMP as dbt_update_at,
        '{{ run_started_at  }}' as dbt_loaded_at 

    FROM base_canal_venda
