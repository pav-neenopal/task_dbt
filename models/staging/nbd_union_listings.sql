{{config(tags = ["union_models","staging_models"])}}
{{ log(var('nbd_filter'), info=True) }}
WITH unioned AS (

    {{ generate_nbd_union(var('nbd_filter')) }}

)

SELECT * FROM unioned