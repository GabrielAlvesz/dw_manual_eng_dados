
  
    

  create  table "dbt_db"."public_intermediate"."int_dim_localidade__dbt_tmp"
  
  
    as
  
  (
    

    WITH base_localidade AS (

        select 
            DISTINCT
            cidade,
            estado
        from "dbt_db"."public_staging"."stg_vendas"

    )

    SELECT
        -- Chave (SK)
        md5(cast(coalesce(cast(cidade as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(estado as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as sk_localidade,

        cidade,
        estado,

        -- Metadados
        CURRENT_TIMESTAMP as dbt_update_at,
        '2026-07-12 16:22:42.642569+00:00' as dbt_loaded_at 

    FROM base_localidade
  );
  