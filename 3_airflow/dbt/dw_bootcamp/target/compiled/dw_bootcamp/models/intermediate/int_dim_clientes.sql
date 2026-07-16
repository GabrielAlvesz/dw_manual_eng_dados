

    WITH base_cliente AS (

        SELECT DISTINCT cliente_id
        FROM "dbt_db"."public_staging"."stg_vendas"

        UNION

        SELECT DISTINCT cliente_id
        FROM "dbt_db"."public_staging"."stg_devolucoes"

    )

    SELECT
        -- Chave (SK)
        md5(cast(coalesce(cast(cliente_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as sk_cliente,

        cliente_id,

        -- Metadados
        CURRENT_TIMESTAMP as dbt_update_at,
        '2026-07-13 23:04:47.200613+00:00' as dbt_loaded_at 

    FROM base_cliente