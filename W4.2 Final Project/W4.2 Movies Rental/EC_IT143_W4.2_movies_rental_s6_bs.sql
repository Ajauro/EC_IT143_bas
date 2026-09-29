
--Q: What are the movies, their genres, and ratings?

--A: Let's ask SQL Server and find out...


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
