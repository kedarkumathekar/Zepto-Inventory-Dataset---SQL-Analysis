USE customer_behaviour;

DROP TABLE IF EXISTS zepto;

Select * from zepto;
-- Change the column name 
Alter table zepto
rename column ï»¿Category to Category;

-- Add new column sku_id which acts as a primary key.
Alter table zepto
ADD column sku_id INT auto_increment First,
add primary key(sku_id);

-- Data exploration

-- count of rows
Select count(*) From zepto;

Select * from zepto
limit 10;

-- Check for null values
Select * from zepto
where name is null
or
category is null
or
mrp is null
or
discountPercent is null
or
discountedSellingPrice is null
or
weightInGms is null
or
outOfStock is null
or
quantity is null;

-- Different product categories
Select distinct category
from zepto
order by category;

-- products instock/outofstock
Select outOfStock,count(*) as count FROM zepto
Group by outOfStock;

-- Productnames present multiple times
Select name,count(*) as no_of_units FROM zepto
group by name
Having no_of_units > 1
order by no_of_units desc;

-- DATA CLEANING -- 

-- 1. Check for products where price is zero
Select *  From zepto
where mrp = 0 or discountedSellingPrice =0;

DELETE FROM zepto 
where mrp =0;

-- Convert mrp and discountedSellingPrice from paise to Rupees
Update zepto
set mrp =mrp/100.00 , discountedSellingPrice = discountedSellingPrice /100.00;

Select mrp,discountedSellingPrice from zepto;

-- Solving Buisness problem questions to uncover insights --

-- Q1) Find the top 10 best value products based on the discout percentage.

Select distinct name,discountPercent from zepto
order by discountPercent DESC
limit 10;

-- Q2) What are the product with high MRP but outOfStock

Select distinct name,mrp,OutOfStock 
From zepto
WHERE outOfStock = 'TRUE'
order by mrp desc
limit 5;

-- Q3) Calculate estimated revenue for each category
Select category,Sum(discountedSellingPrice * availablequantity) as total_revenue FROM zepto
Group by category
order by total_revenue;

-- Q4) Find all the products where MRP is greater than 500 and discount percent is less than 10%
select distinct name,mrp,discountPercent FROM zepto
Where mrp > 500 and discountPercent < 10
order by mrp desc, discountPercent desc;

-- Q5) Identify the top 5 categories offering the highest average discount percentage.
Select category,Round(AVG(discountPercent),2) as avg_discount FROM zepto
Group by category
order by AVG(discountPercent) desc
LIMIT 5;

select * from zepto;
-- Q6) Find the price per gram for products above 100gm and sort by  best value
SELECT distinct name,weightInGms,discountedSellingPrice,(discountedSellingPrice/weightInGms) as price_per_gm FROM zepto
where weightInGms >100
order by price_per_gm desc;

-- Q7) Group the products into categories into low,medium,bulk.
Select name,weightInGms,
CASE WHEN weightInGms < 1000 Then 'Low'
WHEN weightInGms < 5000 THEN 'Medium'
ELSE 'Bulk'
END As Weight_category
FROM zepto
order by weightInGms desc;

-- Add this weight_category column to the dataset
Alter Table zepto
Add column Weight_category varchar(255);

Update zepto
Set Weight_category = CASE WHEN weightInGms < 1000 Then 'Low'
WHEN weightInGms < 5000 THEN 'Medium'
ELSE 'Bulk'
END;

Select * from zepto;

-- Q8) What is the total inventory weight per category
Select category,sum(weightInGms*availableQuantity/1000.00) as totalweight FROM zepto
Group by category
order by totalweight desc;

