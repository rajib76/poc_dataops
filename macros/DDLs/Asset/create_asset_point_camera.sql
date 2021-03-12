{% macro create_table() %}
    {% set sql %}
        create table asset_point_camera
        (
            ASSETID VARCHAR(),
            UTILITYID VARCHAR(),
            ASSETTYPE VARCHAR(),
            MAKEANDMANUFACTURER VARCHAR(),
            MODELNUMBER VARCHAR()
            );
    {% endset %}

{% do run_query(sql) %}
{% do log("Table has been created", info=True) %}
{% endmacro %}