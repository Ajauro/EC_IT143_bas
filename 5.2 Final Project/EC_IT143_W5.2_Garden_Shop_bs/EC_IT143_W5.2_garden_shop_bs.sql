
/*****************************************************************************************************************
NAME: Garden Shop
PURPOSE: Answer questions about the Garden Shop dataset for the 5.2 Final Project

MODIFICATION LOG:
Ver   Date         Author     Description
----- ----------   -------    -------------------------------------------------------------------------------
1.0   10/02/2026   BSOUSA	  1. Built this script for EC IT143


RUNTIME:
1s

NOTES:
This script contains four questions and SQL answers for the Garden Shop dataset.
******************************************************************************************************************/

USE EC_IT143_DA;
GO


/* 
Q1: Which product categories generated the highest total sales, 
and how many units were sold in each category? The store manager 
wants to compare category performance by connecting the Categories, 
Products, and Order_items tables using category names, product IDs, 
quantities, and unit prices.

Author: Kathelyn Gabriela Castro Castillo (classmate)
*/

--Answer:

SELECT
	c.category_name,
	SUM(oi.quantity * oi.unit_price) AS total_sales,
	SUM(oi.quantity) AS units_sold
FROM categories AS c
JOIN products AS p
	ON c.category_id = p.category_id
JOIN order_items AS oi
	ON p.product_id = oi.product_id
GROUP BY
	c.category_name
ORDER BY
	total_sales DESC;



/* 
Q2: Which products have fewer than 20 units on hand? 
Please show the product name, category name, supplier name, 
and quantity on hand, so we can reorder from the right 
suppliers before we run out of stock.
 
Author: Bruna Sousa(me)
*/

--Answer:

SELECT
	p.product_name,
	c.category_name,
	s.supplier_name,
	p.quantity_on_hand
FROM products AS p
JOIN categories AS c
	ON p.category_id = c.category_id
JOIN suppliers AS s
	ON p.supplier_id = s.supplier_id
WHERE 
	p.quantity_on_hand < 20
ORDER BY 
	p.quantity_on_hand ASC;



/* 
Q3: Which suppliers provide the products with the highest average 
profit margin? Please show the supplier name, the number of 
products, and the average difference between price and cost, 
so we can negotiate better terms.
 
Author: Bruna Sousa(me)
*/

--Answer:
	
SELECT
	s.supplier_name,
	COUNT(p.product_id) AS number_of_products,
	CAST(AVG(p.price - p.cost) AS DECIMAL (10,2)) AS average_profit_margin
FROM suppliers AS s
JOIN products AS p
	ON s.supplier_id = p.supplier_id
GROUP BY
	s.supplier_name
ORDER BY
	average_profit_margin DESC;



/* 
Q4: How many orders has each customer placed, and how many are not 
shipped yet? Please show the customer name, state, total orders,
and unshipped orders, so we can follow up on delayed deliveries.

 
Author: Bruna Sousa(me)
*/

--Answer:

SELECT
	CONCAT(gc.first_name, ' ', gc.last_name) AS customer_name, gc.state,
	COUNT(o.order_id) AS total_orders,
	SUM (
		CASE
			WHEN o.shipped_date IS NULL THEN 1
			ELSE 0
		END
	) AS unshipped_orders
FROM garden_customers AS gc
LEFT JOIN orders AS o
	ON gc.customer_id = o.customer_id
GROUP BY
	gc.customer_id,
	gc.first_name,
	gc.last_name,
	gc.state
ORDER BY
	total_orders DESC;
