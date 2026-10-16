
CREATE FUNCTION [dbo].[udf_parse_first_name]
(@v_combined_name AS VARCHAR(500)
)
RETURNS VARCHAR(100)

/*****************************************************************************************************************
NAME: dbo.udf_parse_first_name
PURPOSE: Parse First Name from combined name

MODIFICATION LOG:
Ver    Date         Author        Description
-----  ----------   -----------   -------------------------------------------------------------------------------
1.0    10/15/2026   BSOUSA        1. Built this script for EC IT143


RUNTIME:
Xm Xs

NOTES:
Adapted from the following...
https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name
******************************************************************************************************************/


	BEGIN
		
		DECLARE @v_first_name AS VARCHAR(100);

		SET @v_first_name = LEFT(@v_combined_name, CHARINDEX(' ', @v_combined_name + ' ') - 1);
		
		RETURN @v_first_name;

	END;
GO
