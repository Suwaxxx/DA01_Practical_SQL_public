--baitap1
with a as(
select company_id
from job_listings
group by company_id, title
having count(title)=2 )
select count(company_id)
from a
--baitap2
