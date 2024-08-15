--baitap 1
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
group by t1.page_id
order by t1.page_id


