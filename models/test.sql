with cte as(
select 

to_timestamp(started_at)
from {{ source('demo', 'bike') }}
where started_at != 'started_at'
)

select 
*
from cte

