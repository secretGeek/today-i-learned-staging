﻿# Basic data dictionary

1. Summary of tables:
2. Data Dictionary

---

## Available space on server

	EXEC master..xp_fixeddrives

## Helpdb

    sp_helpdb 'dbName'

## Spaceused

    use dbName
    sp_spaceused

---

## Data Dictionary

## Summary of tables

	use dbName
	SELECT
		s.[Name] as [Schema],
		t.[Name]  as [Table],
		p.[Rows] AS [# Rows],
		(SUM(a.total_pages) * 8)/1024 AS [Total Space MB],
	--    (SUM(a.used_pages) * 8)/1024 AS [Used Space MB],
		((SUM(a.total_pages) - SUM(a.used_pages)) * 8/1024) AS [Unused Space MB],
		case when p.rows > 0 then ((SUM(a.used_pages)*8000 ) / p.rows) else 0 end as [Bytes Per Row]
	FROM
		sys.tables t
	INNER JOIN
		sys.indexes i ON t.OBJECT_ID = i.object_id
	INNER JOIN
		sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
	INNER JOIN
		sys.allocation_units a ON p.partition_id = a.container_id
	LEFT OUTER JOIN
		sys.schemas s ON t.schema_id = s.schema_id
	WHERE
		t.NAME NOT LIKE 'dt%'
		AND t.is_ms_shipped = 0
		AND i.OBJECT_ID > 255
	GROUP BY
		t.Name, s.Name, p.Rows
	ORDER BY
		1

---

## Summary of columns

	use dbName
	SELECT
		schema_name(so.[schema_id]) as [Schema],
		so.[name] AS [Table],
		sc.[name] AS [Column],
		st.[name] AS [Type],
		sc.[max_length] AS [Size]
	FROM
		sys.objects so INNER JOIN sys.columns sc
	ON 	so.object_id = sc.object_id INNER JOIN sys.types st
	ON 	st.system_type_id = sc.system_type_id
	AND	st.name != 'sysname'
	-- AND st.Name like '%Person%' -- Filter by table if you wish
	-- AND schema_name(so.[schema_id]) like '%dbo%' -- Filter by schema
	WHERE
		so.type = 'U'
	ORDER BY
		1,2,3

Also

	- relationships
	- indexes
	- statistics
	- views
	- stored procedures
	- summaries of tables etc

---

## Formatted data for table sizes

This is the same as the first query above, but it also formats the numbers to be more readable (via a CTE and `Format`)

	with Summary as (
		SELECT
			s.[Name] as [Schema],
			t.[Name]  as [Table],
			p.[Rows] AS [Rows],
			SUM(a.total_pages) AS [TotalPages],
			SUM(a.used_pages) as [UsedPages],
			SUM(a.total_pages) - SUM(a.used_pages) as [UnusedPages],
			case when [rows] > 0 then (SUM(a.used_pages) * 1.0 / p.[rows]) else 0 end as [PagesPerRow]
		FROM
			sys.tables t
		INNER JOIN
			sys.indexes i ON t.OBJECT_ID = i.object_id
		INNER JOIN
			sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
		INNER JOIN
			sys.allocation_units a ON p.partition_id = a.container_id
		LEFT OUTER JOIN
			sys.schemas s ON t.schema_id = s.schema_id
		WHERE
			t.NAME NOT LIKE 'dt%'
			AND t.is_ms_shipped = 0
			AND i.OBJECT_ID > 255
		GROUP BY
			t.Name, s.Name, p.Rows
	)
	Select
		[Schema],
		[Table],
		FORMAT([Rows],'#,0') as [Rows],
		FORMAT([TotalPages]*8.0/1024,'#,0.0') as [Total Space MB],
		FORMAT([TotalPages]*8.0/(1024*1024),'#,0.0') as [Total Space GB],
		FORMAT([UnusedPages]*8.0/1024,'#,0.0') as [Unused Space MB],
		FORMAT(PagesPerRow * 8.0, '#,0.0') as [Avg KB/Row],
		FORMAT(PagesPerRow * 8.0/(1024), '#,0.0') as [Avg MB/Row]
	from
	Summary
		ORDER BY		[TotalPages] desc, 7 desc

## See also

- [How much space is left on the drives that my sql server can access?](drive_sizes.md)
- [How much space does my DB use?](how_much_space_does_my_db_use.md)
