--Q: What are the movies, their genres, and ratings?

--A: Let's ask SQL Server and find out...

SELECT movie_id
     , title
     , genre
     , rating
FROM dbo.movies;
