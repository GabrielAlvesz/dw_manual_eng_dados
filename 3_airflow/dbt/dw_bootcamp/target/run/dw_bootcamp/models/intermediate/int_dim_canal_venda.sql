
  
    

  create  table "dbt_db"."public_intermediate"."int_dim_canal_venda__dbt_tmp"
  
  
    as
  
  (
    

    WITH base_canal_venda AS (

        SELECT DISTINCT canal_venda
        FROM "dbt_db"."public_staging"."stg_vendas"

    )

    SELECT
        -- Chave (SK)
        md5(cast(coalesce(cast(canal_venda as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as sk_canal_venda,

        canal_venda,

        -- Metadados
        CURRENT_TIMESTAMP as dbt_update_at,
        '2026-07-12 16:22:42.642569+00:00' as dbt_loaded_at 

    FROM base_canal_venda
  );
  