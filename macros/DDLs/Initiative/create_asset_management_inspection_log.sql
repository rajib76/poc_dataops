{% macro create_asset_management_inspection_log() %}
{% set drop_table ="Y" %}
    {% set sql %}
        {% if drop_table == "Y"  %}
            {% do log("Dropping table", info=True) %}
            drop table if exists asset_management_inspection_log;
        {% endif %}
        create table asset_management_inspection_log
        (   AILOGID VARCHAR(),
            ASSETID VARCHAR(),
            INSPECTION_START_DATE TIMESTAMP,
            INSPECTION_END_DATE TIMESTAMP,
            PERFORMED_BY VARCHAR()
            );
    {% endset %}

{% do run_query(sql) %}
{% do log("Table has been created", info=True) %}
{% endmacro %}
