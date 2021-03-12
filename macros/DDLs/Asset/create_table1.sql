{% macro create_table(operation,col,datatype) %}
{% do log(operation) %}
{% if "CREATE" in operation %}
    {% set sql %}
        drop table test_asset;
        create table test_asset(id varchar());
    {% endset %}
{% elif "ALTER" in operation %}
    {% set sql %}
        alter table add column {{col}} {{datatype}};
    {% endset %}
{% endif %}

{% do run_query(sql) %}
{% do log("Table has been created", info=True) %}
{% endmacro %}