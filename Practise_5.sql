--Baitap1
select distinct city from station
where id%2=0
--Baitap2
select count(city)-count(distinct city) from station
--Baitap3 
select 
ceiling((avg(salary)-avg(replace(salary, '0', ''))))
from employees
--Baitap4 
select round(sum(item_count::DECIMAL*order_occurrences)/sum(order_occurrences),1) as avg_items FROM items_per_order
--Baitap5
SELECT candidate_id FROM candidates
where skill in ('Python', 'Tableau', 'PostgreSQL')  
group by candidate_id
having count(skill)=3
order by candidate_id 
--Baitap6
SELECT user_id,
max(DATE(post_date)) - min(DATE(post_date)) as count_date
FROM posts
where DATE(post_date)<='12/31/2021' and DATE(post_date) >= '01/01/2021'
group by user_id
having count(user_id)>=2
--Baitap7
select card_name , 
max(issued_amount)-min(issued_amount) as disparity
from monthly_cards_issued
group by card_name
order by disparity desc
--Baitap8
SELECT manufacturer, count(product_id), sum(cogs-total_sales) as total_losses
FROM pharmacy_sales
where  total_sales<cogs
group by manufacturer
order by total_losses desc
--Baitap9
select * from cinema
where id%2=1 and not description like '%boring%'
order by rating desc
--Baitap10
select teacher_id, count(distinct subject_id) as cnt
from teacher
group by teacher_id
--Baitap11
select user_id, count(follower_id) as followers_count
from followers
group by user_id
order by user_id
--Baitap12
select class
from courses
group by class
having  count(student)>=5
