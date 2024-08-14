--baitap 1
select b.continent,  floor(avg(a.population) )as average_count
from city as a
left join country as b
 on a.countrycode=b.code
group by b.continent
having b.continent is not null
