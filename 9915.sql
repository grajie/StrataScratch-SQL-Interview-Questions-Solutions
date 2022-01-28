/*
Highest Cost Orders:

Difficulty : Medium

Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01. 
If customer had more than one order on a certain day, sum the order costs on daily basis.
Output their first name, total cost of their items, and the date.

Tables Schema:

<customers>
id					int
first_name			varchar
last_name			varchar
city				varchar
address				varchar
phone_number		varchar

<orders>
id					int
cust_id				int
order_date			datetime
order_details		varchar
total_order_cost	int

SQL Concepts Used:
-- CTE
-- Windows Function   

Logic:
-- Calculate total order cost  for customer per date from  '2019-02-01' and '2019-05-01' 
-- Rank the total order cost and find the customer ,order date that has highest total order cost    */

with cte as
(
	-- Calculate total order cost  for customer per date from  '2019-02-01' and '2019-05-01' 
    select cust_id,order_date,sum(total_order_cost) as total
    from orders
    where order_date between  '2019-02-01' and '2019-05-01'
    group by 1,2 order by 1
) 

select b.first_name,a.dt,a.tot from  
-- Rank the total order cost and find the customer ,order date that has highest total order cost
(
select cte.cust_id as cid ,cte.order_date as dt,cte.total as tot ,rank() over ( order by cte.total desc) as rnk
from cte
) a 
join customers b  --join to get customer name 
on a.cid=b.id
where a.rnk =1
order by 1
