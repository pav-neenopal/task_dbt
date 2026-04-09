{% macro date_diff_weeks(start_date, end_date) %}

    CASE 
        WHEN {{ start_date }} IS NULL OR {{ end_date }} IS NULL THEN NULL
        ELSE DATEDIFF(week, {{ start_date }}, {{ end_date }})
    END

{% endmacro %}