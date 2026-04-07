{% macro insert_audits(action_name) %}
    INSERT INTO AIRBNB.STAGING.AUDITS (
        AUDIT_TYPE,
        MODEL_NAME,
        EXECUTION_TIME
    )
    VALUES (
        '{{ action_name }}',
        '{{ this.name }}',
        CURRENT_TIMESTAMP()
    );
{% endmacro %}