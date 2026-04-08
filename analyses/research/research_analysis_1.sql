{{config(tags = ["data_review"])}}

WITH final AS (
  SELECT * FROM {{ref('verfied_listings')}}
)

SELECT * FROM final LIMIT 10
-- A REGULAR DATA CHECK ON VERIFIED_LISTINGS

