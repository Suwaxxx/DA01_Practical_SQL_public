--baptap1
SELECT 
count( case 
 when device_type = 'laptop' then device_type
end) laptop_reviews,
count( case
when device_type in( 'tablet', 'phone') then device_type
END) mobile_views
FROM viewership
--baitap2
select x,y,z,
case 
when x+y>z and y+z>x and z+x>y then 'Yes'
else 'No'
end triangle
from triangle
--baitap3
SELECT
round( ( cast( count (
CASE when call_category is null  OR call_category = 'n/a' then 0
end) as decimal) /count (*) )*100, 1) as uncategorised_call_pct
from callers
--baitap4
select name
from customer
where referee_id <> 2 or referee_id is null
--baitap5
select 
survived,
count(case when pclass =1 then 1
end )first_class,
count(case when pclass =2 then 1
end ) second_classs,
count(case when pclass =3 then 1
end ) third_class
from titanic
group by survived

