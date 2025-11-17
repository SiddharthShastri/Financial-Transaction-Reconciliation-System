{% macro create_env_conformed(env) %}
    {% set db_name = env ~ '_conformed' %}
    {% set schema_name = 'public' %}

    {% do log('Creating database if not exists: ' ~ db_name, info=True) %}

    {% set create_db %}
        CREATE DATABASE IF NOT EXISTS {{ db_name }};
    {% endset %}
    {% do run_query(create_db) %}

    {% do log('Ensuring schema exists: ' ~ db_name ~ '.' ~ schema_name, info=True) %}

    {% set create_schema %}
        CREATE SCHEMA IF NOT EXISTS {{ db_name }}.{{ schema_name }};
    {% endset %}
    {% do run_query(create_schema) %}
{% endmacro %}
