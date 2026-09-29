
--Q:What are the products, their categories, and prices?

--A: Let's ask SQL Server and find out...


--1) Reload data

TRUNCATE TABLE dbo.t_garden_shop_load;

INSERT INTO dbo.t_garden_shop_load
	SELECT v.product_id
		, v.product_name
		, v.category_name
		, v.price
	FROM dbo.v_garden_shop_load AS v;

--2) Review results

SELECT t.*
	FROM dbo.t_garden_shop_load AS t;