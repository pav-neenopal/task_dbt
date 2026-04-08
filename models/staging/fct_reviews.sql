{{ config(
  materialized='incremental',
  schema = {{env_var('DBT_SCHEMA_SECRET')}},
  incremental_strategy='insert_overwrite',
  partition_by={'field': 'review_date', 'data_type': 'date'},
  incremental_predicates=["review_date >= date_trunc('month', CURRENT_DATE)"]
) }}

WITH reviews AS (
    SELECT * FROM {{ref('clean_reviews')}}
)

SELECT * FROM reviews