
DROP TABLE IF EXISTS dbo.t_hello_world_load;
GO

CREATE TABLE dbo.t_hello_world_load
(
    my_message      VARCHAR(25) NOT NULL,
    CurrentDateTime DATETIME NOT NULL
        DEFAULT GETDATE(),
    CONSTRAINT PK_t_hello_world
        PRIMARY KEY CLUSTERED (my_message ASC)
);
GO

