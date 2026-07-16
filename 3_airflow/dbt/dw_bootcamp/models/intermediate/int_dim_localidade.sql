{{
    config(
        materialized='table',
        unique_key='sk_localidade',
        tags=['intermediate', 'dimension', 'localidade']
    )
}}

    WITH base_localidade AS (

        select 
            DISTINCT
            cidade,
            estado
        from {{ ref('stg_vendas') }}

    )

    SELECT
        -- Chave (SK)
        {{ dbt_utils.generate_surrogate_key(['cidade','estado']) }} as sk_localidade,

        cidade,
        estado,

        -- Metadados
        CURRENT_TIMESTAMP as dbt_update_at,
        '{{ run_started_at  }}' as dbt_loaded_at 

    FROM base_localidade