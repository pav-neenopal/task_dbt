{{config(tags=["intermediate_models"])}}

with listings as (
    SELECT * FROM {{source('airbnb','data')}}
),

reviews AS (
    SELECT  
        id AS listing_id,
        host_id,
        neighbourhood,
        room_type,
        {{clean_prices('price')}} as price_dollars,
        {{clean_prices('service_fee')}} as service_fee_dollars,
        number_of_reviews as review_count,
        last_review,
        reviews_per_month,
        review_rate_number
    FROM listings
)

SELECT * FROM reviews