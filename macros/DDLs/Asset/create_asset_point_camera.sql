{% # Create the asset camera table %}
{% macro create_asset_point_camera() %}
{% set drop_table ="Y" %}

    {% set sql %}
    {% if drop_table == "Y"  %}
        {% do log("Dropping table", info=True) %}
        drop table asset_point_camera;
    {% endif %}
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
