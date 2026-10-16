
--Question 2:
-- How to keep track of when a record was last modified?
--Answer: Maybe use an after update trigger


--Question 3:
--Did it work?
--Answer: Well, lets see...yup

--Remove stuff if it is already there
DELETE FROM dbo.t_hello_world_load
	WHERE my_message IN('Hello World2', 'Hello World3', 'Hello World4');

--Load test rows
INSERT INTO dbo.t_hello_world_load(my_message)
VALUES('Hello World2'), ('Hello World3');

--See if the trigger worked
SELECT t.*
	FROM dbo.t_hello_world_load AS t;

-- Try it again
UPDATE dbo.t_hello_world_load SET my_message = 'Hello World4'
	WHERE my_message = 'Hello World3';

--See if the trigger worked
SELECT t.*
	FROM dbo.t_hello_world_load AS t;