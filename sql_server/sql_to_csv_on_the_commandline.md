# How to run sql queries, to CSV, in powershell, on the commandline

## SQL CMD

If you have sql server management studio installed, then `sqlcmd` should be available from the commandline.

	sqlcmd -S "MySqlServer.somebank.com\high" -d "MyDatabaseName" -E -Q "select count(*) from sysobjects" -o "DataResult.csv" -s"," -w 700

Or, to execute a query stored in a `.sql` file, you can use the `-i` option instead of `-Q`, like this:

	sqlcmd -S "MySqlServer.somebank.com\high" -d "MyDatabaseName" -E -i "ExampleQuery.sql" -o "DataResult.csv" -s"," -w 700

However, `sqlcmd` is quite a poor generator of output, and not recommended as a data extraction tool.

The resulting files can be truncated if the `-w` value is not high enough (you must make it as wide as the widest column), or can create malformed CSV, as there is no escaping performed.

## Powershell SqlServer module and Invoke-SqlCmd cmdlet

It's better to install  the powershell "SqlServer" module, and use `Invoke-SqlCmd` to run queries.

You can install the module from powershell window (run as administrator, btw), with this command:

	Install-Module -Name SqlServer -AllowClobber

To execute an adhoc query, and write it to a CSV file, using the SqlServer module, use the `Invoke-SqlCmd` like so:

	Invoke-Sqlcmd -Query "SELECT count(*) as CCCC from Sysobjects" -ServerInstance "MySqlServer.somebank.com\high" -Database MyDatabaseName | Export-Csv -Path "Filename.csv" -NoTypeInformation

Note we provided a server name (`-ServerInstance`) and a database name (`-Database`).

Or with a full connection string (which you can get from the config of the web application(s)) use the `-ConnectionString` parameter, and don't use the `-ServerInstance` or `-Database` parameters. (Note, I found I did have to edit the connection string to remove the `;TrustServerCertificate=true` clause, and I set the `App=` clause to a meaningful value, as a courtesy)

	Invoke-Sqlcmd -Query "SELECT count(*) as CCCC from Sysobjects" -ConnectionString "data source=MySqlServer.somebank.com\high;initial catalog=MyDatabaseName;integrated security=True;MultipleActiveResultSets=True;App=AdhocSqlScript;Encrypt=false;"  | Export-Csv -Path "ResultData.csv" -NoTypeInformation

Or, to specify a **file that contains the SQL query**, rather than specifying the SQL itself on the commandline, use the `-InputFile` parameter, and *not* the `-Query` parameter

	Invoke-Sqlcmd -InputFile "ExampleQuery.sql" -ConnectionString "data source=MySqlServer.somebank.com\high;initial catalog=MyDatabaseName;integrated security=True;MultipleActiveResultSets=True;App=AdhocSqlScript;Encrypt=false;"  | Export-Csv -Path "ResultData.csv" -NoTypeInformation

## Common failure patterns (Invoke-SqlCmd)

If you get the server instance or database name wrong, you're likely to get errors such as:

> A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct
and that SQL Server is configured to allow remote connections.

If you don't specify the right set of parameters (e.g. you specify a `-Connectionstring` *as well* as either `-ServerInstance` or `-Database`) you will get an error such as:

> Parameter set cannot be resolved using the specified named parameters.

## Running a whole folder of SQL Scripts

We can quickly extend the concepts above, with a light sprinkling of Powershell, to run a whole folder of SQL queries, storing the output from each one of them in a a CSV file that match the source file name.

Given a folder full of `.sql` files that conform to some naming pattern, you can execute each of them against a database, and store the result in a CSV file, as follows.

	dir . "??somepattern??*.sql" | % { write-host "We want to execute '$($_.Name)' against our database, and store the output in '$($_.Name).csv'" }

### Script to execute all `??somepattern??*.sql` query files against the a DB, and store the result in the appropriate CSV file

	# Script to execute all `??somepattern??*.sql` query files against the a DB, and store the result in the appropriate CSV file

	$DBServer = "";
	$DBName =   "";

	dir . "??somepattern??*.sql" | % { 
			"Executing: '$($_.Name)',`nOn DBServer: $DBServer,`nAnd DB: $DBName,`nWith output: '$($_.Name).csv'";
			Invoke-Sqlcmd -InputFile $_.Name -ConnectionString "data source=$($DBServer);initial catalog=$($DBName);integrated security=True;MultipleActiveResultSets=True;App=AdhocSqlScript;Encrypt=false;"  | Export-Csv -Path $($_.BaseName + ".csv") -NoTypeInformation;
			dir $($_.BaseName + ".csv") | % { "Output: $($_.Length) bytes (see $($_.Name))"}
			"`...Executed '$($_.Name)`n`n"
	}

If performing this over a VPN, the first step is connect to the VPN:

1. Connect to the bank's VPN
2. Launch powershell (or SSMS or other query tool) as your user within the virtual network.

For example, if you run something like this:

	runas /netonly /user:somebank\leonb "powershell"

...you will be prompted for the password, then powershell will open in a new window.

Within that the instance of powershell you will have the correct security context to run sql commands (or launch SSMS etc.) from the commandline.

## Common failure patterns

If you needed to connect to a VPN but didn't, you will get error messages such as:

> A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct
and that SQL Server is configured to allow remote connections. (provider: SQL Network Interfaces, error: 26 - Error Locating Server/Instance Specified)

If you are connected to the VPN, but not running as a user of the remote network, you will get error messages such as:

> Failed to generate SSPI context

and/or:

> SQL Server Network Interfaces: No credentials are available in the security package

## All References

- [Execute T-SQL from a script file with sqlcmd](https://learn.microsoft.com/en-us/sql/tools/sqlcmd/sqlcmd-run-transact-sql-script-files?view=sql-server-ver16)
- [PowerShell modules for SQL Server](https://learn.microsoft.com/en-us/powershell/sql-server/download-sql-server-ps-module?view=sqlserver-ps&viewFallbackFrom=sql-server-ver15)
- [Powershell:SqlServer Module](https://www.powershellgallery.com/packages/Sqlserver/22.2.0)
- [Exporting Data with Powershell](https://www.sqlservercentral.com/articles/exporting-data-with-powershell)

## See also

- [Import CSV file to a Database, quickly](../csv/import_csv_to_db.md)
- [Data Table to CSV](../linqpad/datatable_to_csv.md)
- [Aggregate table strings into one csv value (with SQL Server)](table_to_csv.md)
