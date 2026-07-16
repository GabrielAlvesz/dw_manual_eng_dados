

    WITH base_tempo AS (

        SELECT DISTINCT data_pedido as data_completa
        FROM "dbt_db"."public_staging"."stg_vendas"

        UNION

        SELECT DISTINCT data_devolucao as data_completa
        FROM "dbt_db"."public_staging"."stg_devolucoes"

    )

SELECT
    -- Chave (SK)
    md5(cast(coalesce(cast(data_completa as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS sk_tempo,

    data_completa,
    EXTRACT(YEAR FROM data_completa) AS ano,
    EXTRACT(MONTH FROM data_completa) AS mes,
    CASE EXTRACT(MONTH FROM data_completa)
        WHEN 1 THEN 'Janeiro'
        WHEN 2 THEN 'Fevereiro'
        WHEN 3 THEN 'Março'
        WHEN 4 THEN 'Abril'
        WHEN 5 THEN 'Maio'
        WHEN 6 THEN 'Junho'
        WHEN 7 THEN 'Julho'
        WHEN 8 THEN 'Agosto'
        WHEN 9 THEN 'Setembro'
        WHEN 10 THEN 'Outubro'
        WHEN 11 THEN 'Novembro'
        WHEN 12 THEN 'Dezembro'
    END AS nome_mes,
    EXTRACT(DAY FROM data_completa) AS dia,

    -- Metadados
    '2026-07-13 23:04:47.200613+00:00' AS dbt_loaded_at
FROM base_tempo