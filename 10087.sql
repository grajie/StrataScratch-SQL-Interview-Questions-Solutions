
/*
Find all posts which were reacted to with a heart

Difficulty: Medium

Find all posts which were reacted to with a heart.

Tables Schema:
<facebook_reactions>
poster                  int
friend                  int
reaction                varchar
date_day                int
post_id                 int

<facebook_posts>
post_id                 int
poster                  int
post_text               varchar
post_keywords           varchar
post_date               datetime
*/

/*
SQL Concepts Used:
-- CTE
-- Windows Function   

Logic:
-- Find 'Heart' reaction and post_ID related to it
-- Fetch all details corresponding  to the post  */


select * from facebook_posts where post_id in 
(
select distinct p.post_id as post
from facebook_posts p
join facebook_reactions r
on p.post_id=r.post_id
where r.reaction='heart') 