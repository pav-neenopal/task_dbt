  {% macro safe_divide(a, b) %}
  {% if target.type == 'snowflake' %}
    ({{ a }} / NULLIF({{ b }}, 0))
  {% else %}
    ({{ a }} / NULLIF({{ b }}, 0)) -- default
  {% endif %}
{% endmacro %}