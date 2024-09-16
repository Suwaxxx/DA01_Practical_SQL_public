--baitap1
with a as(
select company_id
from job_listings
group by company_id, title
having count(title)=2 )
select count(company_id)
from a
--baitap2
with c as (
select
category,
product,
sum (spend) as total_spend, rank() over(partition by category order by sum(spend) desc) as rank
from product_spend
where extract (year from transaction_date)='2022'
group by category , product
)
select category,
product, total_spend
from c
where rank <=2
order by category, rank
