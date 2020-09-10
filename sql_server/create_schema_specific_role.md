# Create a role that gives a user permissions on a specific schema.

Creates a role named 'SpecificSchemaSuperPowers'

That gives specific permissions (ALTER, DELETE, EXECUTE, INSERT, REFERENCES, SELECT, UPDATE, VIEW DEFINITION) on a specific schema 'SpecificSchema'

(And adds a particular user (AD\BambrickL) to that role)

as follows:

    CREATE ROLE SpecificSchemaSuperPowers AUTHORIZATION dbo;

    GRANT ALTER, DELETE, EXECUTE, INSERT, REFERENCES, SELECT,
              UPDATE, VIEW DEFINITION ON SCHEMA::SpecificSchema TO SpecificSchemaSuperPowers;

And grant those powers, I mean assign that role, to a user or group:

    EXEC sp_addrolemember 'SpecificSchemaSuperPowers', 'AD\BambrickL';


For a "reporting-only" role, on a single schema called MyReportingSchema...


    CREATE ROLE ReportingRole AUTHORIZATION dbo;

    GRANT EXECUTE, REFERENCES, SELECT,
              VIEW DEFINITION ON SCHEMA::MyReportingSchema TO ReportingRole;


And grant those powers, I mean assign that role, to a user or group:
Then add the relevant group or user to that role:


    EXEC sp_addrolemember 'ReportingRole', 'AD\ReportingUser';



## Dynamic SQL for a limited rights user


Next challenge is that for very rare but perfectly acceptable reasons, there is a stored procedure in the `MyReportingSchema` schema, that needs to execute some dynamic sql (with sp_executesql), which selects from other tables in another schema.

(**Yes I protected against sql injection.** I feel I'm safe here because the only dynamic part of the sql, is some integers, which I validate as being integers and in a good range, before I proceed. I can't see a way to sneak any other user data into the query.)

Problem: Dynamic SQL gets run in a different context to the caller. So even though the callers was allowed to execute the stored procedure, they are not allowed to run the *dynamic* sql (it calls a table they can't access.)


This is a sample of code (from [BOL](https://docs.microsoft.com/en-us/previous-versions/sql/sql-server-2008-r2/ms187051(v=sql.105)?redirectedfrom=MSDN) that shows how the inner context and out context are different:

	PRINT 'Outside Dynamic SQL Execution:';
	SET ARITHABORT ON;
	SET ANSI_WARNINGS ON;
	PRINT 1/0;
	PRINT '---------------------------------';

	PRINT 'Inside Dynamic SQL Execution:';
	DECLARE @SQL NVARCHAR(MAX);
	SET @SQL = 'SET ARITHABORT OFF;
				SET ANSI_WARNINGS OFF;
				PRINT 1/0;
				PRINT ''---------------------------------'';'
	EXECUTE sp_executesql @SQL;

	PRINT 'Back outside Dynamic SQL Execution:';
	PRINT 1/0;


In this case Granting to the sproc is not enough.

I thought I had the perfect solution, the `with execute as owner`


	CREATE OR ALTER PROCEDURE [Reporting].[MyDynamicSproc]
		@ID            int
	WITH EXECUTE AS OWNER
	AS
	....



This worked. But when a member of `ReportingRole` tried to execute the sproc, they now received this message:


	Problem: Could not obtain information about Windows NT group/user 'MyActiveDirectoryDomain\ASpecificDBAsName', error code 0x534.

I was surprised to see some random person's name shown as the problem.

I researched and found the owner of the db was 'dbo' and the dbo user was mapped to this NT user account.

Hmmm. What to do?

The main solution people recommended online was to set the owner of the database to 'sa'.

I was reluctant to do this, performed some testing with a different/similar database, which worked fine, when i then tried it on the original database I received:


	Msg 15151, Level 16, State 1, Line 74
	Cannot find the principal 'sa', because it does not exist or you do not have permission.


Eventually I looked at the master database, and saw that its owner was also `dbo` -- but not the same `dbo` as my specific database. The backing user for that `dbo` was a `SQL_USER` called `membersa`

	select * from master.sys.database_principals where principal_id = 1
	select * from MyDataBase.sys.database_principals where principal_id = 1

So with great reluctance I ran this:

	sp_changedbowner 'membersa'

...which returned "Commands completed successfully."

...then re-ran the `with EXECUTE AS OWNER` on each of the sprocs....


	CREATE OR ALTER PROCEDURE [Reporting].[MyDynamicSproc]
		@ID            int
	WITH EXECUTE AS OWNER
	AS
	....


And now found that members of the reporting role were able to run the sprocs:

	-- As member of ReportingRole
	exec [Reporting].[MyDynamicSproc] @ID = 1
	-- ....succeeds (even though it uses dynamic sql that does things the reporting user can't normally do)


FIN.


## Alternative Solution


Another solution which I did not try, but which made sense was from here [Give permissions to a stored procedure, answer by 'dean' (user 3464852)](https://stackoverflow.com/a/22803561/49):


Create a 'limited' user, with an expiry in the distant future (long after your contract runs out, or shortly before) and make them a member of the 'db_owner' role. Have them create a certificate and sign the target sproc.

	create certificate cert_raiser
		encryption by password = 'pGFD4bb925DGvbd2439587y'
		with subject = 'raiser',
		expiry_date = '01/01/2114';
	go

	create user cert_user from certificate cert_raiser
	go

	alter role db_owner add member cert_user
	go

	add signature to [Reporting].[MyDynamicSproc]
	   by certificate cert_raiser
		with password = 'pGFD4bb925DGvbd2439587y';
	go


And instead of being a member of 'db_owner' -- that user could have been a member of a mich more restricted, but fit for purpose, permission set.


## Sources

- [Dynamic context not the same as outer context](https://docs.microsoft.com/en-us/previous-versions/sql/sql-server-2008-r2/ms187051(v=sql.105)?redirectedfrom=MSDN)
- [WITH EXECUTE AS OWNER](https://docs.microsoft.com/en-us/sql/t-sql/statements/execute-as-clause-transact-sql?view=sql-server-ver15)
- [sp_changedbowner](https://docs.microsoft.com/en-us/sql/relational-databases/system-stored-procedures/sp-changedbowner-transact-sql?view=sql-server-ver15)
- [Give permissions to a stored procedure, answer by 'dean' (user 3464852)](https://stackoverflow.com/a/22803561/49)


## See also

- [Create Schema with Authorization](Create_Schema_Authorization.md)
- [create active directory user on sql server](../sql_server/create_active_directory_user_on_sql_server.md)