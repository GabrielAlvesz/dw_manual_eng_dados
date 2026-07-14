

    WITH base_canal_venda AS (

        SELECT DISTINCT canal_venda
        FROM "dbt_db"."public"."stg_vendas"

    )

    SELECT
        -- Chave (SK)
        md5(cast(coalesce(cast(canal_venda as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as sk_canal_venda,

        canal_venda,

        -- Metadados
        CURRENT_TIMESTAMP as dbt_update_at,
        '2026-07-11 13:54:45.375967+00:00' as dbt_loaded_at 

    FROM base_canal_venda