-- A look at all Tables

select * from table_1;
select * from table_2;
select * from table_3;
select * from table_4;
select * from table_5;


-- Updating the Discount column Right Data

update table_3
set Discount = round((100-(New_Price/Older_Price * 100)*1), 0)
where Discount in (select Discount from table_3 where Discount like '%star%');

 
-- Concating the extra Strings

begin tran
update table_3
set Discount = concat('(', Discount, '% ', 'off', ')')
where Discount in (select Discount from table_3 where Discount not like '%of%');

rollback;


/* COMBINING ALL TABLES USING UNION ALL AND CREATING A NEW TABLE USING CTE. */


with cte_data as (
select * from table_1 
UNION ALL
select * from table_2 
UNION ALL
select * from table_3 
UNION ALL
select * from table_4 
UNION ALL
select * from table_5) 
select * into laptop_data from cte_data;


/* FILL NULL VALUES WITH AVERAGE VALUE*/

begin tran
update laptop_data
set Older_Price = (select avg(Older_Price) from Laptop_data where Older_Price is Not Null)
where Older_Price is Null;

rollback


begin tran
update laptop_data
set New_Price = (select avg(New_Price) from Laptop_data where New_Price is Not Null)
where New_Price is Null;


begin tran
update laptop_data
set Discount = concat('(', round((100-(New_Price/Older_Price * 100)*1), 0), '% ', 'off', ')')
where Discount is Null

begin tran
update laptop_data
set Rating = 'Not Available'
where Rating is Null;

-- Concating with the Needed Data
begin tran
update laptop_data
set Discount = concat('(', Discount, '% ', 'off', ')')
where Discount  Not like '%of%'

-- Round off Numerical Data
begin tran 
update laptop_data
set Older_Price = ROUND(Older_Price, 0), New_Price = ROUND(New_Price, 0)

select * from laptop_data


/* DATA CLEANING */
-- Filling The Right Data in Rating Column

begin tran
update laptop_data
set Rating = REPLACE(Rating, 'out of 5 stars', 'stars')
where Rating like '%stars%';

-- Replacing Unwanted Data
begin tran
update laptop_data
set Product_Name = trim(REPLACE(Product_Name, '(Renewed)', ''))
where Product_Name like '%Renewed%';


select * from laptop_data


select * from laptop order by Company
select company, count(company) as product_count, round(avg(price), 0) as avg_price from 
laptop group by company order by product_count desc;
select company, count(company) as count_company from Laptop group by company order by company asc

-- Write a query to find the new price who have a greater than average older price of their respective 

update  mobile_data
set OS = 'iOS v16' where company = 'Apple'
select * from mobile_data;

update mobile_data
set OS = 'Android v12' where OS = 'Android v 12'