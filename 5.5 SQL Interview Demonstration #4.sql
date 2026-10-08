USE EC_IT143_DA;
GO

/*****************************************************************************************************************
NAME: employee_salary table
PURPOSE: Answer the SQL question for this assignment 5.5 SQL Interview Demonstration #4

MODIFICATION LOG:
Ver   Date         Author     Description
----- ----------   -------    -------------------------------------------------------------------------------
1.0   10/07/2026   BSOUSA	  1. Built this script for EC IT143


RUNTIME:
1s

NOTES:
This script contains one answer to a question from 5.5 SQL Interview Demonstration #4 Assignment
******************************************************************************************************************/


--create table
CREATE TABLE employee_salary (
	employee_id INT,
	employee_name VARCHAR(100),
	department_id INT,
	employee_salary DECIMAL (10,2)
);

--add your data inside the table, using INSERT INTO
INSERT INTO employee_salary 
	(employee_id, employee_name, department_id, employee_salary)
VALUES
	(1, 'Rowan Shepherd', 1, 1000.00),
	(2, 'Rimsha Melendez', 1, 900.00),
	(3, 'Tiah Sanford', 1, 900.00),
	(4, 'Cayden Mcclure', 1, 700.00),
	(5, 'Ellena Dyer', 2, 1200.00),
	(6, 'Marcus Knox', 2, 800.00),
	(7, 'Tashan Dalby', 2, 700.00),
	(8, 'Arif Sutherland', 2, 500.00);


SELECT * 
FROM employee_salary;


--Write an SQL select statement to find the top three 
--employees who have the highest salary in each department. 

WITH ranked_employee_salary AS (
    SELECT
        employee_name,
        department_id,
        employee_salary,
        ROW_NUMBER() OVER (
            PARTITION BY department_id
            ORDER BY employee_salary DESC, employee_id
        ) AS row_number
    FROM employee_salary
)
SELECT
    employee_name,
    department_id,
    employee_salary
FROM ranked_employee_salary
WHERE row_number <= 3;


	

