{% macro generate_nbd_union(nbd_list) %}

{% if not nbd_list %}
    -- No neighbourhoods provided
    select null as dummy where false

{% else %}

    {% if nbd_list is string %}
        {% set nbd_list = [nbd_list] %}
    {% endif %}

    {% for nbd in nbd_list %}

        SELECT *
        FROM {{ ref('clean_listings') }}
        WHERE neighbourhood = '{{ nbd }}'

        {% if not loop.last %}
        UNION ALL
        {% endif %}

    {% endfor %}

{% endif %}

{% endmacro %}