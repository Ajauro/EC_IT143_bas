

--Q:What are the products, their categories, and prices?

--A: Let's ask SQL Server and find out...

SELECT p.product_id
	, p.product_name
	, c.category_name
	, p.price
FROM dbo.products AS p
JOIN dbo.categories AS c
	ON p.category_id = c.category_id;


