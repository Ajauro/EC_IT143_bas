
DROP VIEW IF EXISTS dbo.v_garden_shop_load;
GO

CREATE VIEW dbo.v_garden_shop_load
AS

/*****************************************************************************************************************
NAME:    dbo.v_garden_shop_load
PURPOSE: Create the Garden Shop - Load view

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     29/09/2026   BSOUSA        1. Built this script for EC IT143

RUNTIME:
1s

NOTES:
This script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL Data Manipulation
******************************************************************************************************************/

-- Q: What are the products, their categories, and prices?

SELECT p.product_id
	, p.product_name
	, c.category_name
	, p.price
FROM dbo.products AS p
JOIN dbo.categories AS c
	ON p.category_id = c.category_id;



/* check answer
SELECT *
FROM dbo.v_garden_shop_load;
*/

