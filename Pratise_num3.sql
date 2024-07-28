--baitap1
select name
from students
where marks>75 
order by right(name,3), id
--baitap2
select user_id,
upper(left(name,1)) || lower(substring(name from 2 for length(name)-1))as name
from users
order by user_id
--baitap3
select manufacturer,
concat('$', round((sum(total_sales)/1000000),0),' million') as sale
from pharmacy_sales
group by manufacturer
order by sum(total_sales) desc, manufacturer
--baitap4
select
extract(month from submit_date) as mth,
product_id as product,
round(avg(stars),2) as avg_stars
from reviews
group by extract(month from submit_date), product_id
order by mth, product
--baitap5
select sender_id,
count(*) as message_count
from messages
where to_char(sent_date, 'mm/yyyy')='08/2022'
group by sender_id
order by message_count desc
limit 2
--baitap6
select
tweet_id
from tweets
where length(content)>15
--baitap7
select
activity_date as day, count(distinct user_id) as active_users
from activity
where activity_date <='2019-07-27' and activity_date >'2019-06-27'
group by activity_date
--baitap8
select count(id)
from employees
where to_char(joining_date,'yyyy-mm') between '2019-01' and '2019-07'
--baitap9
select 
worker_id, first_name,
position ('a' in first_name)
from worker
where first_name='Amitah'
--baitap10
select title, 
substring(title from length(winery)+2 for 4) as vintage_years
from winemag_p2
where country='Macedonia'
