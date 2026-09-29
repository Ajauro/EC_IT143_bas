
DROP TABLE IF EXISTS dbo.t_movies_rental_load;
GO

CREATE TABLE dbo.t_movies_rental_load
(
	movie_id INT NOT NULL,
	title VARCHAR(255) NOT NULL,
	genre VARCHAR(100) NOT NULL,
	rating DECIMAL(3,1) NULL,

	CONSTRAINT PK_t_movies_rental
		PRIMARY KEY CLUSTERED (movie_id ASC)
);
GO