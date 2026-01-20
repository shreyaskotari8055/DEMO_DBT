with bike as (
    select 
    distinct
    start_statio_id as station_id,
    start_station_name as station_name,
    start_lng as station_lng,
    start_lat as station_lat    
    from {{ source('demo', 'bike') }}
    where ride_id != 'RIDE_ID'
)

select 
*
from bike