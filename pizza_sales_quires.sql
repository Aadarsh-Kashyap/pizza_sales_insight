create database pizza_sales;
select * from piza;


-- Total Revenue 
select ROUND(sum(total_price),2) as 'REVENUE' 
from piza;

--Avg. Order Value
SELECT round(sum(total_price)/count(distinct(order_id)),2) as 'avg order value' 
from piza;

--Total Pizza Sold
select sum(quantity) 'total quantity sold' from piza;

-- Total Orders Place
select count(order_id) as 'unique total order' from piza; -- one order 
select count(distinct(order_id))'Total order' from piza; --more than one order

-- Avg pizza order 
SELECT 
    CAST(CAST(SUM(quantity) AS DECIMAL(10, 2)) / 
    CAST(COUNT(DISTINCT order_id) AS DECIMAL(10, 2)) AS DECIMAL(10, 2)) AS 'Avg Pizza Order'
FROM 
    piza;
--Daily Trends
select datename(DW,order_date) as 'order day',
				count(order_id) as 'total order' from piza
								group by datename(DW,order_date)
									order by count(order_id) desc ;

-- Monthly order
select datename(month, order_date) as 'Month_Name',count(distinct(order_id)) as 'total order'
				from piza
					group by datename(month, order_date)
					order by count(distinct(order_id)) desc ;

-- % Sales by Category
select pizza_category,
			round(sum(total_price)*100/(select sum(total_price) from piza),2) as 'PCT'
			from piza
				group by pizza_category;
select * from piza;

--percentage of sale by pizza size
select pizza_size,
			round(sum(total_price)*100/(select sum(total_price) from piza),2) as 'PCT'
			from piza
				group by pizza_size;

--  Top 5 Salers by revenue,Total Quantity and total orders;
select top 5 pizza_name,sum(total_price)as 'total_revenue'  from piza
group by pizza_name
order by total_revenue desc;

--  Top 5 Salers by revenue,Total Quantity and total orders;
select top 5 pizza_name,sum(total_price)as 'total_revenue'  from piza
group by pizza_name
order by total_revenue asc;

--  Top 5 Pizza by Quantity,Total Quantity and total orders;
select top 5 pizza_name,count(distinct (order_id)) as 'Top Piza'  from piza
group by pizza_name
order by count(distinct (order_id)) desc;

--  Botom 5 Pizza by Quantity,Total Quantity and total orders;
select top 5 pizza_name,count(distinct (order_id)) as 'Top Piza'  from piza
group by pizza_name
order by count(distinct (order_id)) asc;
--



select * from piza;
