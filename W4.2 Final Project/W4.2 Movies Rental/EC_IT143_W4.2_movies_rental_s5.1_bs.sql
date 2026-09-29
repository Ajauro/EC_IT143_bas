
--Q: What are the movies, their genres, and ratings?

--A: Let's ask SQL Server and find out...

DROP TABLE IF EXISTS dbo.t_movies_rental_load;
GO

SELECT v.movie_id
	, v.title
	, v.genre
	, v.rating
INTO dbo.t_movies_rental_load
FROM dbo.v_movies_rental_load AS v;