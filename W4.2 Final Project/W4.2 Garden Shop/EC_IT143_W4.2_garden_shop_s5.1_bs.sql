
--Q:What are the products, their categories, and prices?

--A: Let's ask SQL Server and find out...

DROP TABLE IF EXISTS dbo.t_garden_shop_load;
GO

SELECT v.product_id
	, v.product_name
	, v.category_name
	, v.price
INTO dbo.t_garden_shop_load
FROM dbo.v_garden_shop_load AS v;




/* check answer
SELECT *
FROM dbo.t_garden_shop_load;
*/
