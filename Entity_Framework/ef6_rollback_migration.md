# EF6: Rollback to a previous migration

EF6 migrations/rollbacks are performed with the `ef6.exe` tool.

This tool is available inside the Entity Framework nuget package, e.g.

	~\packages\EntityFramework.6.4.4\tools\net45\any\ef6.exe

You might want to copy that `tools` folder to the server from which you need to run the script.

	.\ef6.exe database update --assembly "PATH\TO\YOUR_DB_Context_DB.dll" --config "Path\To\Your\Connection\String\Containing\Web.config" --target Migration_To_Roll_Back_To --force -v

You will see output like this:

	Specify the '-Verbose' flag to view the SQL statements being applied to the target database.

(It always says that even when you *did* specify a migration!)

	Target database is: 'YOUR_DB' (DataSource: YOUR_DB_SERVER, Provider: System.Data.SqlClient, Origin: Configuration).

And for each migration being rolled back you'll see the result of running the 'down' function, as well as removing the migration itself from `[dbo].[__MigrationHistory]`

	Reverting migrations: [202106211412384_Migration_After_The_One_Your_Targeting].
	Reverting explicit migration: 202106211412384_Migration_After_The_One_Your_Targeting.
	DELETE [dbo].[__MigrationHistory]
	WHERE (([MigrationId] = N'202106211412384_Migration_After_The_One_Your_Targeting') AND ([ContextKey] = N'Your_DbContext'))