{% macro rename_to_camel_case(column) %}
  {% set cleaned = column | replace('_', ' ') | title | replace(' ', '') %}
  {{ cleaned[0] | lower ~ cleaned[1:] }}
{% endmacro %}