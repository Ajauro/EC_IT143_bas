
DROP PROCEDURE IF EXISTS dbo.usp_movies_rental_load;
GO

CREATE PROCEDURE dbo.usp_movies_rental_load
AS

/*****************************************************************************************************************
NAME:    dbo.usp_movies_rental_load
PURPOSE: Movies Rental - Load user stored procedure

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

		TRUNCATE TABLE dbo.t_movies_rental_load;

		INSERT INTO dbo.t_movies_rental_load
			SELECT v.movie_id
				, v.title
				, v.genre
				, v.rating
			FROM dbo.v_movies_rental_load AS v;

		--2) Review results

		SELECT t.*
			FROM dbo.t_movies_rental_load AS t;

	END;
GO


