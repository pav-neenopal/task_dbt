WITH reviews AS (
    SELECT * FROM {{ref('reviews_date_summary')}}
),

metric AS (
    SELECT  
        listing_id,
        {{ safe_divide('review_count','weeks_since_last_review') }} AS review_count_by_weeks_age
    FROM reviews
)

SELECT * FROM metric