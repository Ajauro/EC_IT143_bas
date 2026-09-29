
DROP PROCEDURE IF EXISTS dbo.usp_garden_shop_load;
GO

CREATE PROCEDURE dbo.usp_garden_shop_load
AS

/*****************************************************************************************************************
NAME:    dbo.usp_garden_shop_load
PURPOSE: Garden Shop - Load user stored procedure

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     29/09/2026   BSOUSA        1. Built this script for EC IT143

RUNTIME:
1s

NOTES:
This script exists to help me learn step 7 of 8 in the Answer Focused Approach for T-SQL Data Manipulation
******************************************************************************************************************/

	BEGIN
		
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

	END;
GO