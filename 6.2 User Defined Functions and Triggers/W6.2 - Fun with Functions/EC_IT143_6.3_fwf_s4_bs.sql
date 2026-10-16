--Question 1:
-- How to extract the first name from the contact name?

--Answer:
--Well, here is your problem...
--CustomerName = [Full name] -> [FirstName]
--CustomerName = Alejandra Camino -> Alejandra
-- https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name


SELECT t.ContactName
	, LEFT(t.ContactName, CHARINDEX(' ', t.ContactName + ' ') - 1) AS first_name
FROM dbo.t_w3_schools_customers AS t
ORDER BY 1;