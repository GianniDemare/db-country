-- QUERY

-- 1. Selezionare tutte le nazioni il cui nome inizia con la P e la cui area è maggiore di 1000 kmq.
select *
from countries c 
where name like 'P%' and area >= 1000;

-- 2. Contare quante nazioni sono presenti nel database.
select count(*) as total_countries
from countries c 

-- 3. Selezionare il nome delle regioni del continente europeo, in ordine alfabetico.
select r.name 
from regions r 
where r.continent_id = 4
order by name asc;

-- 4. Contare quante regioni sono presenti nel continente Africa.
select count(*) as total_regions_continents_Africa
from regions r 
join continents c on r.continent_id = c.continent_id 
where c.name = 'Africa';

-- 5. Selezionare quali nazioni non hanno un national day.
select *
from countries c 
where national_day is null;

-- 6. Per ogni nazione, in ordine alfabetico, selezionare il nome, la regione e il continente.
select c.name, r.name , c2.name 
from countries c 
join regions r on c.region_id  = r.region_id  
join continents c2 on r.continent_id  = c2.continent_id 
order by c.name asc;

-- 7. Selezionare le lingue ufficiali dell’Albania.
select l.`language` 
from country_languages cl 
join countries c on cl.country_id = c.country_id 
join languages l on cl.language_id  = l.language_id 
where c.name = 'Albania' and cl.official = 1;

-- 8. Selezionare il Gross domestic product (GDP) medio dello United Kingdom tra il 2000 e il 2010.
select avg(cs.gdp) as average_gdp
from country_stats cs 
join countries c on cs.country_id = c.country_id 
where c.name  = 'United Kingdom' and cs.`year`>= 2000 and cs.`year` <= 2010;

-- 9. Selezionare tutte le nazioni in cui si parla hindi, ordinate dalla più estesa alla meno estesa.
select *
from countries c 
join country_languages cl on c.country_id  = cl.country_id 
join languages l on cl.language_id = l.language_id 
where l.`language` = 'Hindi';

-- 10. Modificare la nazione di nome Italy, inserendo come national day il 2 giugno 1946.
update countries 
set national_day = '1946-06-02'
where name = 'Italy';

-- BONUS

-- 11. Selezionare le nazioni il cui national day è avvenuto prima del 1900, ordinate per national day dal più recente al meno recente.
select *
from countries c 
where national_day <= '1900-01-01'
order by national_day desc;

-- 12. Contare quante lingue sono parlate in Italia.
select count(*) as total_languages
from countries c 
join country_languages cl on c.country_id  = cl.country_id 
join languages l on cl.language_id = l.language_id 
where c.name = 'Italy';

-- 13. Per la regione Antarctica mostrare il valore dell’area totale e dell’area media delle nazioni.
select 
    r.name AS region_name,
    SUM(c.area) AS total_area,
    AVG(c.area) AS average_area
from regions r
join countries c ON r.region_id = c.region_id
where r.name = 'Antarctica'
group by r.name;

