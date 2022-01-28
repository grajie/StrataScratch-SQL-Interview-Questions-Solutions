
/*
Find the top-ranked songs for the past 30 years.

Difficulty: Medium

Find all the songs that were top-ranked (at first position) at least once in the past 30 years

Tables:

<billboard_top_100_year_end>
year                                int
year_rank                           int
group_name                          varchar
artist                              varchar
song_name                           varchar
id                                  int
*/

/*

SQL Concepts Used:
-- Date Functions

Logic:
--Filter songs that has top rank in last 30 years 
--Return the Song Name*/

select song_name 
from billboard_top_100_year_end 
where year_rank=1
and
year between year(current_date())-30 and year(current_date())
order by 1