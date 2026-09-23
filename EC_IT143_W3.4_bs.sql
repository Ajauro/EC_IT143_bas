/*****************************************************************************************************************
NAME:    W3.4 Adventure Works—Create Answers Assignment 
PURPOSE: Answer 8 user questions using SQL and the AdventureWorks sample database.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     09/22/2026   BSOUSA		   1. Built this script for EC IT 143


RUNTIME: 
1.0 seconds

NOTES: 
Queries built for W3.4 - Adventure Works—Create Answers Assignment. Questions include Business User questions with 
Marginal, Moderate, and Increased complexity, as well as Metadata questions using INFORMATION_SCHEMA views. 
******************************************************************************************************************/

USE AdventureWorks2022;
GO


-- QUESTION 1 - Business User Question - Marginal Complexity
-- Author: Maroon Chifuwo

/* List the top 10 most expensive products currently sold by AdventureWorks, 
showing only the product name and the list price. */

--ANSWER: The query returns the 10 most expensive products that are currently being sold, 
--showing the product name(Name) and list price(ListPrice).

SELECT TOP 10
	Name,
	ListPrice
FROM Production.Product 
WHERE SellEndDate IS NULL  
ORDER BY ListPrice DESC;



-- QUESTION 2 - Business User Question - Marginal Complexity
-- Author: Bruna Sousa(Me)

/* Which employees were hired after February 1, 2013? */

--ANSWER: The query returns the employees who were hired after February 1, 2013,
--showing their first name, last name, and hire date.

SELECT	
	BusinessEntityID, 
	JobTitle, 
	HireDate 
FROM HumanResources.Employee 
WHERE HireDate > '2013-02-01' 
ORDER BY HireDate;



-- QUESTION 3 - Business User Question - Moderate Complexity
-- Author: David Okoedo Aijiabhu

/* I am interested in product categories. For each product category, how many products
do we sell, and what is the average list price.*/

--ANSWER: The query returns each product category, the number of products in each
--category, and the average list price of those products.

SELECT
    pc.Name AS ProductCategory,
    COUNT(p.ProductID) AS ProductQuantity,
    ROUND (AVG(p.ListPrice), 2) AS AverageListPrice
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc
    ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name
ORDER BY pc.Name;



-- QUESTION 4 - Business User Question - Moderate Complexity
-- Author: Fernando Pereira da Trindade

/* Which customer category purchases the largest quantity of products? 
Include customer type and total units purchased.*/

--ANSWER: The results show that Individual customers purchased the largest
--number of units compared to Store customers.

--Final answer
SELECT
    CASE
        WHEN c.PersonID IS NOT NULL THEN 'Individual'
        ELSE 'Store'
    END AS CustomerType,
    COALESCE(SUM(sod.OrderQty), 0) AS TotalUnitsPurchased
    --COALESSE: means, if the first value is null, use the next value, or change the value NULL to zero(0)
FROM Sales.Customer AS c
LEFT JOIN Sales.SalesOrderHeader AS soh
    ON c.CustomerID = soh.CustomerID
LEFT JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY
    CASE
        WHEN c.PersonID IS NOT NULL THEN 'Individual'
        ELSE 'Store'
    END
ORDER BY TotalUnitsPurchased DESC;

--TEST QUERY: This query checks the customer types in the Sales.Customer Table
--and shows the number of customers in each category.
/* SELECT
    CASE
        WHEN PersonID IS NOT NULL THEN 'Individual'
        ELSE 'Store'
    END AS CustomerType,
    COUNT(*) AS CustomerCount
FROM Sales.Customer
GROUP BY
    CASE
        WHEN PersonID IS NOT NULL THEN 'Individual'
        ELSE 'Store'
    END; */




-- QUESTION 5 - Business User Question - Increased Complexity
-- Author: Innocentia Ekechukwu

/* The sales team wants to understand which products contribute most to revenue.
Can you identify the top products by total sales amount and include the product name, quantity sold,
and total revenue for each product? */

--ANSWER: (The question asks for “top products,” and it's necessary to turn that 
--into a specific, concrete number, so I decided to list the top 10 products.)
--The query shows the 10 products with the highest total revenue, showing the product name,
--quantity sold, and total revenue.

SELECT TOP 10
    p.Name AS ProductName,
    SUM(sod.OrderQty) AS QuantitySold,
    SUM(sod.LineTotal) AS TotalRevenue
FROM Production.Product AS p
INNER JOIN Sales.SalesOrderDetail AS sod
    ON p.ProductID = sod.ProductID
GROUP BY p.Name
ORDER BY TotalRevenue DESC;



-- QUESTION 6 - Business User Question - Increased Complexity
-- Author: Ximena Gomora Flores

/* Management wants to evaluate bycicle sales performance during 2013. Create a monthly
report showing the quantity sold, average list price, standard cost, and estimated
profit for each bicycle category.*/

--ANSWER: The query returns a monthly report for bicycle sales in 2013, showing
--the quantity sold, the average list price, average standard cost,
--and estimated profit.

SELECT
    YEAR(soh.OrderDate) AS SalesYear,
    MONTH(soh.OrderDate) AS SalesMonth,
    pc.Name AS ProductCategory,
    SUM(sod.OrderQty) AS QuantitySold, 
    ROUND(AVG(p.ListPrice), 2) AS AverageListPrice,
    ROUND(AVG(p.StandardCost), 2) AS AverageStandardCost,
    SUM(sod.OrderQty * (p.ListPrice - p.StandardCost)) AS EstimatedProfit
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc
    ON ps.ProductCategoryID = pc.ProductCategoryID
WHERE
    YEAR(soh.OrderDate) = 2013
    AND pc.Name = 'Bikes'
GROUP BY
    YEAR(soh.OrderDate),
    MONTH(soh.OrderDate),
    pc.Name
ORDER BY
    SalesMonth;



-- QUESTION 7 - Business User Question - Metadata Question
-- Author: Aniebiet-abasi Baron Sunday

/* Which tables in the Production schema contain a column named ProductID,
according to INFORMATION_SCHEMA.COLUMNS? */

--ANSWER: The query returns the tables in the Production schema that contain
--a column named ProductID, using the INFORMATION_SCHEMA.COLUMN metadata view.

SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Production'
    AND COLUMN_NAME = 'ProductID'
ORDER BY TABLE_NAME;




-- QUESTION 8 - Business User Question - Metadata Question
-- Author: Godsend Clever Glory Boutoto

/* How many tables exist in the AdventureWorks database according to
INFORMATION_SCHEMA.TABLES? */

--ANSWER: The query returns the total number of base tables in the AdventureWorks2022
--database according to INFORMATION_SCHEMA.TABLES, and the result is 71 tables.

SELECT COUNT (*) AS TableCount
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';