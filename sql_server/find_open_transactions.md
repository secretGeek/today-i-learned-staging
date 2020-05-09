# Find open transactions in SQL Server

	DBCC OPENTRAN;


And this more extreme example (also from `docs.microsoft`) creates a table of the results....


	-- Create the temporary table to accept the results.  
	CREATE TABLE #OpenTranStatus (  
	   ActiveTransaction varchar(25),  
	   Details sql_variant   
	   );  
	-- Execute the command, putting the results in the table.  
	INSERT INTO #OpenTranStatus   
	   EXEC ('DBCC OPENTRAN WITH TABLERESULTS, NO_INFOMSGS');  
	  
	-- Display the results.  
	SELECT * FROM #OpenTranStatus;  
	GO


## Source

- [DBCC OPENTRAN (Transact-SQL)](https://docs.microsoft.com/en-us/sql/t-sql/database-console-commands/dbcc-opentran-transact-sql?view=sql-server-ver15)