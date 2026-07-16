
  
    

  create  table "dbt_db"."public_intermediate"."int_dim_forma_pagamento__dbt_tmp"
  
  
    as
  
  (
    

    WITH base_forma_pagamento AS (

        SELECT DISTINCT forma_pagamento
        FROM "dbt_db"."public_staging"."stg_vendas"

    )

    SELECT
        -- Chave (SK)
        md5(cast(coalesce(cast(forma_pagamento as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as sk_forma_pagamento,

        forma_pagamento,

        -- Metadados
        CURRENT_TIMESTAMP as dbt_update_at,
        '2026-07-12 16:22:42.642569+00:00' as dbt_loaded_at 

    FROM base_forma_pagamento
  );
  