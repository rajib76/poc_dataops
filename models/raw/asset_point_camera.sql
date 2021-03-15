{{
  config(
    materialized='from_internal_stage'
  )
}}

select $1,$2,$3,$4,$5
from @asset_stage