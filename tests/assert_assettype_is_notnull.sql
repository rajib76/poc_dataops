select
    ASSETTYPE
from {{ ref('asset_point_camera' )}}
WHERE ASSETTYPE IS NULL OR ASSETTYPE = ''