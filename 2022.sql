/*
Update Call Duraiton: (StrataScratch ID 2022)

Difficulty : Medium

Redfin helps clients to find agents. Each client will have a unique request_id and each request_id has several calls. 
For each request_id, the first call is an “initial call” and all the following calls are “update calls”.  
What's the average call duration for all update calls?

Tables Schema:

<redfin_call_tracking>
request_id			int
call_duration		int
created_on		datetime

SQL Concepts Used:
-- CTE
-- Windows Function   

Logic:
-- select calls, grouping by request_id and ranking them in the order of time call received. 
-- Calculate  Average call duration for the request_id skipping the first call (rank=1)    */

with cte as
(select request_id,call_duration,rank() over (partition by request_id order by created_on) as rnk
from redfin_call_tracking)
select request_id,avg(call_duration)
from cte
where rnk != 1
group by request_id