
DROP VIEW IF EXISTS dbo.v_movies_rental_load;
GO

CREATE VIEW dbo.v_movies_rental_load
AS

/*****************************************************************************************************************
NAME:    dbo.v_movies_rental_load
PURPOSE: Create the Movies Rental - Load view

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     29/09/2026   BSOUSA        1. Built this script for EC IT143

RUNTIME:
1s

NOTES:
This script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL Data Manipulation
******************************************************************************************************************/

-- Q: What are the movies, their genres, and ratings?

SELECT movie_id
     , title
     , genre
     , rating
FROM dbo.movies;


--check the answer
/*SELECT *
FROM dbo.v_movies_rental_load;
*/
