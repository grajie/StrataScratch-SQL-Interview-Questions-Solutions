
/*
Favorite Host Nationality

Difficulty: Medium

For each guest reviewer, find the nationality of the reviewer’s favorite host based on the guest’s highest review score given to a host. Output the user ID of the guest along with their favorite host’s nationality.

Tables Schema:

<airbnb_reviews>
from_user               int
to_user                 int
from_type               varchar
to_type                 varchar
review_score            int

<airbnb_hosts>
host_id                 int
nationality             varchar
gender                  varchar
age                     int
*/

/*
SQL Concepts Used:
-- Subquery
-- Join
-- Windows Function: Dense_rank()

Logic:
-- Find max(review_score) per guest
-- Find host_id that received it
-- Fetch host nationality with host_id 
-- Remove Duplicates  */

select distinct a.from_user,h.nationality from
(
	select from_user,to_user,review_Score,dense_rank() over (partition by from_user order by review_score desc) as rnk 
	from airbnb_reviews 
	where from_type='guest' 
) a
join airbnb_hosts h
on a.to_user = h.host_id
where a.rnk =1
order by 1