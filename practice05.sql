--BAI TAP PRATICE
--baitap 1 Em gần như mỗi ngày làm một bài và cuối cùng cũm làm xong :>>> Iu anh BCS lớp <3333
select b.continent,  floor(avg(a.population) )as average_count
from city as a
left join country as b
 on a.countrycode=b.code
group by b.continent
having b.continent is not null
--baitap2
SELECT 
round(cast(count(t2.email_id) as decimal)
/count(distinct t1.email_id),2) as confirm_rate 
FROM emails  as t1
left join texts as t2
on t1.email_id=t2.email_id
and t2.signup_action ='Confirmed'
--baitap3
SELECT t2.age_bucket,
round(sum(case WHEN t1.activity_type ='send' THEN t1.time_spent end)*100.0
/sum(case WHEN t1.activity_type in ('send','open') THEN t1.time_spent end),2) as send_perc,
round(sum(case WHEN t1.activity_type ='open' THEN t1.time_spent end)*100.0
/sum(case WHEN t1.activity_type in ('send','open') THEN t1.time_spent end),2) as open_perc
FROM activities as t1
join age_breakdown as t2
on t1.user_id = t2.user_id
group by t2.age_bucket
--Baitap4
SELECT
t1.customer_id FROM customer_contracts as t1
inner JOIN products as t2
on t1.product_id=t2.product_id
group by t1.customer_id
having count(distinct t2.product_category)=(select count(distinct product_category) from products)
/*vẫn là baitap4: anh ơi sau khi em double check với solution thì em thấy là bài này và cũng nhiều bài khác nó dùng with...as
Tại em thấy hơi loạn não dài dòng nên trc đó em vẫn chưa nạp with...as vào đầu. Giờ em thử viết ạ
Hình như bản chất nó chỉ là tạo một cái output tạm thời/output ảo/... để mình xử lý tiếp trên output đó 1 lần nữa đúng ko ạ?
Về sau chị Julie có dạy cái with...as này ko ạ anh ơi~~ 
*/
with temp_output as ( SELECT
t1.customer_id, count(distinct t2.product_category) as temp_count
FROM customer_contracts as t1
inner JOIN products as t2
on t1.product_id=t2.product_id
group by t1.customer_id )
select customer_id
from temp_output 
where temp_count = (select count(distinct product_category) from products)
--baitap5
select t2.employee_id, t2.name, 
count(t1.reports_to)as reports_count, round(avg(t1.age),0) as average_age 
from Employees as t1 
inner join Employees as t2
on t1.reports_to=t2.employee_id
group by t2.employee_id, t2.name
order by t2.employee_id
--baitap6
select
t1.product_name, sum(t2.unit) as unit
from products as t1
left join orders as t2
on t1.product_id =t2.product_id 
where t2.order_date between '2020-02-01' and '2020-02-29'
group by t1.product_id, t1.product_name
having sum(t2.unit) >=100 
--baitap7
select t1.page_id
from pages as t1
left join page_likes as t2
on t1.page_id=t2.page_id
where user_id is null
order by t1.page_id

--BAI TAP Mid course
--baitap1
select distinct replacement_cost
from film
order by replacement_cost
limit 1
--baitap2
with temp_output as (
	select 
case
when replacement_cost between 9.99 and 19.99
then 'low'
when replacement_cost between 20.00 and 24.99
then 'medium'
when replacement_cost between 25.99 and 29.99
then 'high'
end category,
count (film_id)
from film
group by category
)
select category from temp_output
where category='low'
--baitap3
select t1.title as film_title, t1.length, t3.name as category_name
from film as t1
join film_category as t2
on t1.film_id=t2.film_id
	left join category as t3
	on t2.category_id=t3.category_id
	where t3.name in ('Drama', 'Sports')
	order by t1.length desc
limit 1
--baitap4
select t3.name as category_name, concat(count (t1.title), ' titles') as count_title
	from film as t1
join film_category as t2
on t1.film_id=t2.film_id
		left join category as t3
	on t2.category_id=t3.category_id
group by t3.name
order by count_title desc
limit 1
--baitap5
select concat(t1.first_name,' ', t1.last_name) as ho_va_ten, concat(count(*), ' movies') as count
	from actor as t1
	right join film_actor as t2
	on t1.actor_id=t2.actor_id
left join film as t3
on t2.film_id=t3.film_id
group by t1.first_name, t1.last_name
order by count(*) desc
limit 1
--baitap6
select count (*) 
from address as t1
	left join customer as t2
on t1.address_id= t2.address_id
where t2.customer_id is null
--baitap7
select t1.city,  coalesce(sum(amount),0) as revenue
	from city as t1
 left join address as t	
	on t1.city_id=t.city_id
	left join customer as t2
		on t.address_id=t2.address_id
	left join payment as t3
on t2.customer_id=t3.customer_id
group by t1.city
order by revenue desc
limit 1
--baitap 8 (dạ bài này em thấy chị Jolie ghi đề là cao nhất nhưng để đáp án là 50.85 nên em làm theo đáp án ạ<333)
select concat (t2.city, ', ', t1.country) as address, sum(amount) as revenue
from city as t2
left join country as t1
		on t1.country_id=t2.country_id
left join address as t3
		on t2.city_id=t3.city_id
left join customer as t4
	on t3.address_id=t4.address_id
left join payment as t5
on t4.customer_id=t5.customer_id
group by t1.country, t2.city
having sum(amount) is not null
order by sum(amount)
limit 1
