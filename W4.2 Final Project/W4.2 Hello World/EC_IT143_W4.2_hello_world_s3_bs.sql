
--Create an ad hoc SQL query


-- Q: What is the current date and time?

-- A: Let's ask SQL Server and find out...
--We need to find the date and time information in SQL Server.

SELECT 'Hello World' AS my_message
, GETDATE() AS CurrentDateTime;