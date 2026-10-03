
/*****************************************************************************************************************
NAME: Movie Rentals 
PURPOSE: Answer questions about the Movie Rentals dataset for the 5.2 Final Project

MODIFICATION LOG:
Ver   Date         Author     Description
----- ----------   -------    -------------------------------------------------------------------------------
1.0   10/02/2026   BSOUSA	  1. Built this script for EC IT143


RUNTIME:
1s

NOTES:
This script contains four questions and SQL answers for the Movie Rentals dataset.
******************************************************************************************************************/

USE EC_IT143_DA;
GO


/* 
Q1: Which movie genres generate the most rental revenue? Please show each genre, 
the number of rentals, and the total rental amount, so I can decide which genres 
to stock more of next quarter.
 
Author: Bruna Sousa(Me)
*/

--Answer:

SELECT
	m.genre,
	COUNT(r.rental_id) AS number_of_rentals,
	SUM(r.amount) AS total_rentals_amount
FROM movies AS m
INNER JOIN rentals AS r
	ON m.movie_id = r.movie_id
GROUP BY
	m.genre
ORDER BY
	total_rentals_amount DESC;



/* 
Q2: Which cities have customers who spend the most on rentals? 
Please list each city, the number of customers who rented, and 
the total amount spent, so we can plan promotions in the best cities.
 
Author: Bruna Sousa(Me)
*/

--Answer:

SELECT
	c.city,
	COUNT(DISTINCT c.customer_id) AS number_of_customers,
	SUM(r.amount) AS total_amount_spent
FROM customers AS c
INNER JOIN rentals AS r
	ON c.customer_id = r.customer_id
GROUP BY
	c.city
ORDER BY
	total_amount_spent DESC;



/* 
Q3: Which movies were returned more than seven days after the rental date? 
Please show the movie title, customer name, rental date, returned date,
and days kept, so we can review our late return policy.

Author: Bruna Sousa(Me)
*/

--Answer:
SELECT
    m.title,
    c.first_name,
    c.last_name,
    r.rental_date,
    r.returned_date,
    DATEDIFF(DAY, r.rental_date, r.returned_date) AS days_kept
FROM rentals AS r
INNER JOIN movies AS m
    ON r.movie_id = m.movie_id
INNER JOIN customers AS c
    ON r.customer_id = c.customer_id
WHERE r.returned_date IS NOT NULL
  AND DATEDIFF(DAY, r.rental_date, r.returned_date) > 7
ORDER BY
    days_kept DESC;



/* 
Q4: Which movie genre has generated the highest total rental 
revenue, based on the sum of the amount field in the Rentals table?

Author: Benjamin Aboagye Yeboah (classmate)
*/

--Answer: The answer will show each genre and its toal rental revenue,
--the highest total appears first.

SELECT 
	m.genre,
	SUM(r.amount) AS total_rental_revenue
FROM movies AS m
INNER JOIN rentals AS r
	ON m.movie_id = r.movie_id
GROUP BY
	m.genre
ORDER BY
	total_rental_revenue DESC;

--or if you want only the top 1 genre

SELECT TOP 1
	m.genre,
	SUM(r.amount) AS total_rental_revenue
FROM movies AS m
INNER JOIN rentals AS r
	ON m.movie_id = r.movie_id
GROUP BY
	m.genre
ORDER BY
	total_rental_revenue DESC;