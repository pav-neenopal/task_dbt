{{config(tags=["intermediate_models"])}}

with listings as (
    SELECT * FROM {{source('airbnb','data')}}
),

clean_listings as (

    SELECT 
        id AS listing_id,
        NVL(name,'Not Specified') as listing_name,
        host_id,
        host_identity_verified,
        country,
        neighbourhood,
        room_type,
        construction_year,
        cancellation_policy,
        number_of_reviews as review_count,
        {{clean_prices('price')}} as price_dollars,
        {{clean_prices('service_fee')}} as service_fee_dollars
    FROM listings

)

SELECT * FROM clean_listings