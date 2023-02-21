use project;
select * from data1;
select count(*) from data1;
select count(*) from data2;
select * from data1

-- getting the district that are coming more than 1 time in dataset.
select district, count(district) from data1 group by district having count(district)>1


-- getting the data where district is "bilaspur" and "raigarh".
select * from data1 where district in('Raigarh', 'Bilaspur');
select * from data2;


-- population of india.
select sum(population) from data2


-- average of growth.
select avg(growth) from data1;
select avg(growth)*100 avg_growth from data1; -- in average percent
select top 10 state, avg(growth)*100 as avg_growth from data1 group by state order by avg_growth desc;


-- average of sex_ratio.
select * from data1;
select top 10 state, round(avg(sex_ratio), 0) as avg_sex_ratio from data1 group by state order by
avg_sex_ratio asc;


-- average of literacy rate.
-- top 5 states with highest literacy.
select top 5 state, round(avg(literacy), 0) as avg_literacy_rate from data1
group by state
having round(avg(literacy), 0)>80
order by avg_literacy_rate desc;


-- top 5 states with lowest literacy.
select top 5 state, round(avg(literacy), 0) as avg_literacy_rate from data1
group by state
having round(avg(literacy), 0)<70
order by avg_literacy_rate asc;


-- creating a view to show the top states with high literacy rate.
drop view top_literacy_states;

create view [top_literacy_states] as
select state, round(avg(literacy), 0) as avg_literacy_rate from data1
group by state
having round(avg(literacy), 0)<70;


-- print the new created VIEW.
select distinct state, avg_literacy_rate from top_literacy_states order by avg_literacy_rate asc;













