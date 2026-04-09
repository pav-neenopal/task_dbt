SELECT
    listing_id,
    review_count,
    {{ date_diff_weeks('last_review', 'CURRENT_DATE') }} AS weeks_since_last_review
FROM {{ ref('clean_reviews') }}