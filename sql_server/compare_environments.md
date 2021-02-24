# Compare environments

## To compare object names between environments, compare the result of a query such as:

	SELECT top(400)
		schema_name(so.[schema_id]) + '.' + so.[name] as [FullName],
		schema_name(so.[schema_id]) as [Schema],
		so.[name] AS [Table],
		so.[type]
	FROM
		sys.objects so
	WHERE
		so.type not in ('S','PK','IT')
	AND schema_name(so.[schema_id])	in ('Schema1', 'Schema2') -- e.g. where focusing on only some schemas
	AND so.[name] not like '%zz%' -- e.g. where ignoring certain object names
	ORDER BY 1

## To compare column details between environments, compare the result of a query such as:

	SELECT top(800)
		schema_name(so.[schema_id]) + '.' + so.[name] + '.' + sc.[name] AS [ID],
		schema_name(so.[schema_id]) as [Schema],
		so.[name] AS [Table],
		sc.[name] AS [Column],
		st.[name] AS [Type],
		sc.[max_length] AS [Size],
		so.type as [Object Type]
	FROM
		sys.objects so INNER JOIN sys.columns sc
	ON 	so.object_id = sc.object_id INNER JOIN sys.types st
	ON 	st.system_type_id = sc.system_type_id
	AND	st.name != 'sysname'
	WHERE
		so.type in ('U','V')
	AND NOT st.[name] in ('hierarchyid','geometry')
	AND schema_name(so.[schema_id])	in ('Schema1', 'Schema2') -- e.g. where focusing on only some schemas
	AND so.[name] not like '%zz%' -- e.g. where ignoring certain object names
	ORDER BY
		1,2,3

## To compare hashes of views/sprocs/functions between environments, use a query such as:

(These rely on [TrimWhiteSpace, LTrimWhiteSpace, RTrimWhiteSpace...](find_whitespace.md))

	Select 	'zonk://objectname/' + schema_name(so.uid) + '.' + so.[name] + '|' + schema_name(so.uid) + '.' + so.[name]  AS [Schema.Object],
		so.xtype,
		len(Definitions.Definition) as [Length of definition],
	master.dbo.fn_varbintohexstr(hashbytes('MD5', Definitions.Definition)) as Hasho
	from
	sysobjects so
	outer apply (Select stuff(	(select dbo.TRIMWHITESPACE(sc.text)
						from syscomments  sc
					where sc.id = so.id
					order by colid
					for xml path , TYPE).value('.[1]','nvarchar(max)'
				), 1, 0, '') as Definition) as Definitions
	where Definitions.Definition is not null
	AND schema_name(so.[schema_id])	in ('Schema1', 'Schema2') -- e.g. where focusing on only some schemas
	AND so.[name] not like '%zz%' -- e.g. where ignoring certain object names
	order by  3 desc

## To compare actual views/sprocs/functions - use a query such as:

	Select
		Definitions.Definition as 'View definition'
	from
	sysobjects so
	outer apply (Select stuff(	(select ' ' + sc.text
						from syscomments  sc
					where sc.id = so.id
					order by colid
					for xml path , TYPE).value('.[1]','nvarchar(max)'
				), 1, 1, '') as Definition) as Definitions
	where Definitions.Definition is not null
	and
		schema_name(so.[uid]) + '.' + so.[name]  = @objectname

## See also

- [Basic data dictionary](data_dictionary.md)