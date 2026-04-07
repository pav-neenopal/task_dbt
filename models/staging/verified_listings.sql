{{config(tags = ["master_models","staging_models"])}}

WITH cleaned_listings AS (
  SELECT * FROM {{ref('clean_listings')}}
),

verified_listings AS (
SELECT * FROM cleaned_listings
WHERE host_identity_verified = 'verified'
),

final AS (SELECT * FROM verified_listings)

SELECT * FROM final
-- Added final cte to follow best practices