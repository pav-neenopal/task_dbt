{{config(tags = ["master_models","staging_models"])}}

WITH cleaned_listings AS (
  SELECT * FROM {{ref('clean_listings')}}
),

verified_listings AS (
SELECT * FROM cleaned_listings
WHERE host_identity_verified = 'verified'
)

SELECT * FROM verified_listings

-- Main branch prefers this