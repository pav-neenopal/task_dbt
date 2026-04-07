{% macro extract_domain(email_column) %}
  SPLIT_PART({{ email_column }}, '@', 2)
{% endmacro %}