
DROP TABLE IF EXISTS dbo.t_garden_shop_load;
GO

CREATE TABLE dbo.t_garden_shop_load
(
	product_id	INT NOT NULL,
	product_name	VARCHAR(100) NOT NULL,
	category_name	VARCHAR(100) NOT NULL,
	price			DECIMAL(10,2) NOT NULL,
	CONSTRAINT PK_t_garden_shop
		PRIMARY KEY CLUSTERED (product_id ASC)
);
GO