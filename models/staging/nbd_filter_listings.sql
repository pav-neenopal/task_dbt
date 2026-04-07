{{config(tags = ["filter_models","staging_models"],
        partition_by = {"field": "host_identity_verified", "data_type": "varchar"}
)}}

WITH listings AS (
    SELECT * FROM {{ref('clean_listings')}}
),

nbd_listings AS (
    SELECT * FROM listings
    WHERE neighbourhood IN (
        {% for nbd in var("nbd_filter") %}
            '{{ nbd }}'{% if not loop.last %},{% endif %}
        {% endfor %}
    )
)

SELECT * FROM nbd_listings