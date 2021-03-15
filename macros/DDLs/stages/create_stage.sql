{% macro create_stage() %}
    {% set sql %}
        CREATE STAGE ASSET_STAGE;
        CREATE STAGE INSPECTION_STAGE;
    {% endset %}

{% do run_query(sql) %}
{% do log("Stage has been created", info=True) %}
{% endmacro %}