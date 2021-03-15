{% # test comment %}
{{
  config(materialized='incremental',incremental_strategy='merge', unique_key= "assetid")

}}
{# config(materialized= "table", unique_key= "assetid" ) #}
with asset_cameras as (

    select * from {{ref('asset_point_camera')}}

) ,

asset_inspections as (

    select * from {{ref('asset_management_inspection_log')}}

) ,

final as (

    select
        asset_cameras.assetid,
        asset_cameras.utilityid,
        asset_cameras.assettype,
        asset_cameras.makeandmanufacturer,
        asset_cameras.modelnumber,
        asset_inspections.inspection_start_date,
        asset_inspections.inspection_end_date,
        asset_inspections.performed_by
    from asset_cameras
        join asset_inspections using (assetid)

)

select * from final