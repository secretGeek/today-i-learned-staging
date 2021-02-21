# Aggregate table strings into one csv value (with SQL Server)

i.e. concatenate strings in SQL Server

Turn some literal values into a comma separated string variable:

	declare @CSV varchar(max) = null
	select  @CSV = isnull(@CSV + ', ', '') + [Value]
	from    (values
				('One')
			,   ('Two')
			,   ('Three')
			) v ([Value])
	print @CSV -- Prints 'One, Two, Three'


Turn some table values into a comma separated string variable:

	declare @CSV varchar(max) = null
	select  top 5 @CSV = isnull(@CSV + ', ', '') + [name]
	from    sysobjects
	print @CSV -- Prints 'sysrscols, sysrowsets, sysclones, sysallocunits, sysfiles1'



Return comma separated string, not as a variable though, as part of a result set.

	select DISTINCT schema_name(UID),
		SUBSTRING(
			(
				SELECT ','+ [Name]  AS [text()]
				FROM sysobjects s1
				WHERE s1.UID = s2.UID
				ORDER BY s1.[Name]
				FOR XML PATH ('')
			), 2, 4000) [Names]
	FROM sysobjects s2
	order by 1


Note that if the `Name` contains any XML-breaking characters (e.g. `<`), you might need to do more work with the `Name`, to encode those and then decode them.


## See also

- [Csv To Html function in SQL](CsvToHtml_Function_in_SQL.md)
- [Import CSV using SSMS tools](import_csv.md)
- [Split string in SQL Server](split_string.md)