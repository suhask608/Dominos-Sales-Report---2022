--KPI Requirements:
SELECT * FROM [Project_Pizza].[dbo].[dominos_sales$]
--1)Total Revenue
SELECT sum(total_price) as Total_Revenue
  FROM [Project_Pizza].[dbo].[dominos_sales$]
--Ans: 817860.049999992

--2)Avg Order Value
SELECT sum(total_price)/count(distinct order_id) as Avg_order_value
  FROM [Project_Pizza].[dbo].[dominos_sales$]
--Ans: 38.3072622950816

--3) Total Pizzas Sold
SELECT sum(quantity) as Total_Pizza_sold
  FROM [Project_Pizza].[dbo].[dominos_sales$]
--Ans: 49574

--4)Total Orders
Select count(distinct order_id) as Total_Orders
  FROM [Project_Pizza].[dbo].[dominos_sales$]
--Ans: 21350

--5)Avg Pizzas per Order
Select sum(quantity)/count(distinct order_id) as Avg_Pizzas_per_order
  FROM [Project_Pizza].[dbo].[dominos_sales$]
--Ans: 2.32196721311475

--Chart Requirements:
SELECT * FROM [Project_Pizza].[dbo].[dominos_sales$]
--1)Daily trends for total orders
select DATENAME(DW, order_date) as order_day, count(distinct order_id) as total_order --DW: day of a week
FROM [Project_Pizza].[dbo].[dominos_sales$]
group by DATENAME(DW, order_date)

--2) Monthly trends for total orders
select DATENAME(Month, order_date) as order_month, count(distinct order_id) as total_order 
FROM [Project_Pizza].[dbo].[dominos_sales$]
group by DATENAME(Month, order_date)

--3)Percentage of sales by pizza category
select pizza_category, sum(total_price) as total_revenue, sum(total_price) * 100 /
  (select sum(total_price) FROM [Project_Pizza].[dbo].[dominos_sales$]) as Perc_pizza_sales FROM [Project_Pizza].[dbo].[dominos_sales$] 
  group by pizza_category

--4)Percentage of sales by pizza size
select pizza_size, sum(total_price) as total_revenue, sum(total_price) * 100 /
  (select sum(total_price) FROM [Project_Pizza].[dbo].[dominos_sales$]) as Perc_pizza_sales FROM [Project_Pizza].[dbo].[dominos_sales$] 
  group by pizza_size

--5)Total pizza sold by pizza category
select pizza_category, sum(quantity) as total_quantity FROM [Project_Pizza].[dbo].[dominos_sales$]
   group by pizza_category
   order by pizza_category desc;

--6)Top 5 best seller by revenue, total quantity and total orders

--a)Top 5 best seller by revenue:
select top 5 pizza_name, sum(total_price) as Total_price
FROM [Project_Pizza].[dbo].[dominos_sales$]
group by pizza_name
order by Total_price desc

--b)Top 5 best seller by total quantity:
select top 5 pizza_name, sum(quantity) as Total_quantity
FROM [Project_Pizza].[dbo].[dominos_sales$]
group by pizza_name
order by Total_quantity desc

--c)Top 5 best seller by total orders:
select top 5 pizza_name, count(distinct order_id) as Total_orders
FROM [Project_Pizza].[dbo].[dominos_sales$]
group by pizza_name
order by Total_orders desc

--7)Bottom 5 least seller by revenue, total quantity and total orders

--a)Bottom 5 best seller by revenue:
select top 5 pizza_name, sum(total_price) as Total_price
FROM [Project_Pizza].[dbo].[dominos_sales$]
group by pizza_name
order by Total_price

--b)Bottom 5 best seller by total quantity:
select top 5 pizza_name, sum(quantity) as Total_price
FROM [Project_Pizza].[dbo].[dominos_sales$]
group by pizza_name
order by Total_price

--c)Bottom 5 best seller by total orders:
select top 5 pizza_name, count(distinct order_id) as Total_orders
FROM [Project_Pizza].[dbo].[dominos_sales$]
group by pizza_name
order by Total_orders 