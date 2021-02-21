# Create active directory user on SQL Server

If an active directory user can't access a database you might see:

	Login failed for user 'MYDOMAIN\MYUSER'.

If the user has never accessed any database on that server, then a DBA needs to created the login at a server level first, e.g.:


	USE [master]
	GO
	CREATE LOGIN [MYDOMAIN\MYUSER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
	GO


A DBA can then create the user on the specific database with this command:

	USE [TheSpecificDatabase]
	GO

	CREATE USER [MYDOMAIN\MYUSER] FOR LOGIN [MYDOMAIN\MYUSER] WITH DEFAULT_SCHEMA=[dbo]

And can then grant `db_owner` role with:

	ALTER ROLE [db_owner] ADD MEMBER [MYDOMAIN\MYUSER]

Or with:

	EXEC sp_addrolemember N'db_owner', N'MYDOMAIN\MYUSER'

If uncomfortable with `db_owner` you might consider `db_datareader` instead.

## See also

- [Create Schema Authorization](../sql_server/Create_Schema_Authorization.md)
- [create schema specific role](../sql_server/create_schema_specific_role.md)