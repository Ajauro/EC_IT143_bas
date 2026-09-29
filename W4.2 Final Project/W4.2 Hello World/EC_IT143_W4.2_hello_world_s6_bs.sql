--Q: What is the current date and time?

--A: Let's ask SQL Server and find out...


--1) Reload data

TRUNCATE TABLE dbo.t_hello_world_load;

INSERT INTO dbo.t_hello_world_load
	SELECT v.my_message
		, v.CurrentDateTime
	FROM dbo.v_hello_world_load AS v;

--2) Review results

SELECT t.*
	FROM dbo.t_hello_world_load AS t;