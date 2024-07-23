--Baitap1
select distinct city from station
where id%2=0
--Baitap2
select count(city)-count(distinct city) from station
--Baitap3 em khom biet lammm
select ceiling(avg(salary)-avg(salary?)) from employees
--Baitap4 
select round(sum(item_count::DECIMAL*order_occurrences)/sum(order_occurrences),1) as avg_items FROM items_per_order

