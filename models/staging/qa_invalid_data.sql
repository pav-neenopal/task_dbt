WITH listings AS (
    SELECT * FROM {{ref('clean_listings')}}
),

null_status_listings AS (
    SELECT * FROM listings
    WHERE host_identity_verified is NULL
)

SELECT * FROM null_status_listings
