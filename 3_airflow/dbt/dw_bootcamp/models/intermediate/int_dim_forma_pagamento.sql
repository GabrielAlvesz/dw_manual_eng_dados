{{
    config(
        materialized='table',
        unique_key='sk_forma_pagamento',
        tags=['intermediate', 'dimension', 'forma_pagamento']
    )
}}

    WITH base_forma_pagamento AS (

        SELECT DISTINCT forma_pagamento
        FROM {{ ref('stg_vendas') }}

    )

    SELECT
        -- Chave (SK)
        {{ dbt_utils.generate_surrogate_key(['forma_pagamento']) }} as sk_forma_pagamento,

        forma_pagamento,

        -- Metadados
        CURRENT_TIMESTAMP as dbt_update_at,
        '{{ run_started_at  }}' as dbt_loaded_at 

    FROM base_forma_pagamento