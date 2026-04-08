
{{ config(materialized = var("materialization_type"), tags=["filter_models","staging_models"])}}
WITH raw_listings AS (
  SELECT * FROM {{ source('airbnb', 'data') }}
),

filter_listings AS (
    SELECT * FROM raw_listings
    WHERE country = '{{var("country_filter")}}'
),

final AS (SELECT * FROM filter_listings)

SELECT * FROM final

-- Added final CTE to follow best practice