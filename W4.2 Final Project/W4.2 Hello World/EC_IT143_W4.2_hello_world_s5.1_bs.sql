
-- Q: What is the current date and time?

--A: Let's ask SQL Server find out...

DROP TABLE IF EXISTS dbo.t_hello_world_load;
GO

SELECT v.my_message
	, v.CurrentDateTime
	INTO dbo.t_hello_world_load
FROM dbo.v_hello_world_load AS v;

