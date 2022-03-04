with cte as
(select request_id,call_duration,rank() over (partition by request_id order by created_on) as rnk
from redfin_call_tracking)
select request_id,avg(call_duration)
from cte
where rnk != 1
group by request_id