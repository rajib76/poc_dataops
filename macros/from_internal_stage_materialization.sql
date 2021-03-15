{% materialization from_internal_stage, adapter='snowflake' -%}
{%- set target_relation = api.Relation.create(schema=schema, identifier=model['alias'], type='table') -%}
{%- call statement('main') -%}
        COPY INTO {{ target_relation }}
        FROM ({{ sql }})
{% endcall %}
{{ run_hooks(post_hooks, inside_transaction=True) }}

    -- `COMMIT` happens here
    {{ adapter.commit() }}

    {{ run_hooks(post_hooks, inside_transaction=False) }}
{%- endmaterialization %}
