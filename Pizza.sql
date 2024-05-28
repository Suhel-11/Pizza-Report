select * from pizza_sales

select SUM(total_price) as Total_Revenue from pizza_sales 
--817860.05083847

select SUM(total_price) / COUNT(distinct order_id) as Ave_order_value from pizza_sales
--38.3072623343546

select SUM(quantity) as Total_Pizza_Sold from pizza_sales
--49574

select COUNT(distinct order_id) as Total_Orders from pizza_sales
--21350

select cast(cast(SUM(quantity) as decimal (10,2))/ cast(COUNT(distinct order_id) as decimal (10,2)) as decimal (10,2)) as Avg_Pizzas_per_order from pizza_sales
--2.3219672131147 after cast 2.32

select DATENAME(DW,order_date) as order_day, COUNT(distinct order_id) as Total_Orders from pizza_sales
group by DATENAME(DW, order_date)
--Saturday 3158, Wednesday	3024, Monday 2794, Sunday 2624, Friday 3538, Thursday 3239, Tuesday	2973

select DATENAME(month, order_date) as Month_Name, COUNT(distinct order_id) as Total_orders from pizza_sales
group by DATENAME(month, order_date)
order by Total_orders desc
--February June August April May December January September October July November March
--1685 1773 1841 1799 1853 1680 1845 1661 1646 1935 1792 1840

select pizza_category, Cast(SUM(total_price) as decimal(10,2)) as Total_Sales, SUM(total_price)*100/(select SUM(total_price) from pizza_sales) 
as PCT from pizza_sales
group by pizza_category
--Classic	26.9059602306976 Chicken 23.9551375322885 Veggie	23.6825910258677 Supreme 25.4563112111462

--Month
select pizza_category, Cast(SUM(total_price) as decimal(10,2)) as Total_Sales, SUM(total_price)*100/(select SUM(total_price) from pizza_sales) 
as PCT from pizza_sales
where MONTH(order_date)=1
group by pizza_category

select pizza_size, Cast(SUM(total_price) as decimal(10,2)) as Total_Sales, cast(SUM(total_price)*100/(select SUM(total_price) from pizza_sales) 
as decimal(10,2)) as PCT from pizza_sales
group by pizza_size
order by pizza_size desc

--Quarter
select pizza_size, Cast(SUM(total_price) as decimal(10,2)) as Total_Sales, cast(SUM(total_price)*100/(select SUM(total_price) from pizza_sales) 
as decimal(10,2)) as PCT from pizza_sales
where datepart(Quarter, order_id)=1
group by pizza_size
order by pizza_size desc

select top 5 pizza_name, SUM(total_price) as Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue desc