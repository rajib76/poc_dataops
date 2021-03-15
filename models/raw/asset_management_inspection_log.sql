/*
http://mamykin.com/posts/fast-data-load-snowflake-dbt/
This model copies the data from the inpsection stage and loads it into the 
asset_management_inspection_log table
*/
{{
  config(
    materialized='from_internal_stage'
  )
}}

select $1,$2,$3,$4,$5
from @inspection_stage