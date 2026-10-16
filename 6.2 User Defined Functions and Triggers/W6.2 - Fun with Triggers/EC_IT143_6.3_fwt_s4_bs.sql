
CREATE TRIGGER trg_hello_world_last_mod ON dbo.t_hello_world_load
AFTER UPDATE
AS

/*****************************************************************************************************************
NAME: dbo.trg_hello_world_las_mod
PURPOSE: Hello World - Last Modified By Trigger

MODIFICATION LOG:
Ver     Date          Author         Description
-----   ----------    -----------    -------------------------------------------------------------------------------
1.0		10/16/2026    BSOUSA         1. Built this script for EC IT143


RUNTIME:
Xm Xs

NOTES:
Keep track of the last modified date for each row in the table

******************************************************************************************************************/


	UPDATE dbo.t_hello_world_load
			SET
				last_modified_date = GETDATE()
		WHERE my_message IN
		(
			SELECT DISTINCT
				my_message
			FROM Inserted
		);

