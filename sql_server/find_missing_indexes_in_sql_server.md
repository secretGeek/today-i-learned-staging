# Find missing indexes in sql server

Just as you can find unused indexes in sql server, so you can find 'missing' indexes. And similarly there are some caveats that come with blindly accepting what the clever queries tell you.

Identifying that an index is missing is just part of the journey. You also need to look at index consolidation, and the total cost of the index... for example how does it affect your insert/update performance?

But caveats aside here are the CODES.


	SELECT
		db.[name] AS [DatabaseName]
		,schema_name([objects].[schema_id]) + '.' + [objects].[name] AS [Table]
		,gs.[unique_compiles] AS [UniqueCompiles]
		,gs.[user_seeks] * gs.[avg_total_user_cost] * (gs.[avg_user_impact] * 0.01) AS [IndexAdvantage]
		,gs.[user_seeks] AS [UserSeeks]
		,gs.[user_scans] AS [UserScans]
		,gs.[last_user_seek] AS [LastUserSeekTime]
		,gs.[last_user_scan] AS [LastUserScanTime]
		,gs.[avg_total_user_cost] AS [AvgTotalUserCost]  -- Average cost of the user queries that could be reduced by the index in the group.
		,gs.[avg_user_impact] AS [AvgUserImpact]  -- The value means that the query cost would on average drop by this percentage if this missing index group was implemented.
		,gs.[system_seeks] AS [SystemSeeks]
		,gs.[system_scans] AS [SystemScans]
		,gs.[last_system_seek] AS [LastSystemSeekTime]
		,gs.[last_system_scan] AS [LastSystemScanTime]
		,gs.[avg_total_system_cost] AS [AvgTotalSystemCost]
		,gs.[avg_system_impact] AS [AvgSystemImpact]  -- Average percentage benefit that system queries could experience if this missing index group was implemented.
		,id.[equality_columns] AS [EqualityColumns]
		,id.[inequality_columns] AS [InEqualityColumns]
		,id.[included_columns] AS [IncludedColumns]
		,'CREATE INDEX [IX_' + OBJECT_NAME(id.[object_id], db.[database_id]) + '_' + REPLACE(REPLACE(REPLACE(ISNULL(id.[equality_columns], ''), ', ', '_'), '[', ''), ']', '') + CASE
			WHEN id.[equality_columns] IS NOT NULL
				AND id.[inequality_columns] IS NOT NULL
				THEN '_'
			ELSE ''
			END + REPLACE(REPLACE(REPLACE(ISNULL(id.[inequality_columns], ''), ', ', '_'), '[', ''), ']', '') + '_' + LEFT(CAST(NEWID() AS [nvarchar](64)), 5) + ']' + '
			ON
			' + id.[statement] + ' (' + ISNULL(id.[equality_columns], '') + CASE
			WHEN id.[equality_columns] IS NOT NULL
				AND id.[inequality_columns] IS NOT NULL
				THEN ','
			ELSE ''
			END + ISNULL(id.[inequality_columns], '') + ')' + ISNULL('
			INCLUDE
			(' + id.[included_columns] + ')', '') AS [ProposedIndex]
		--,CAST(CURRENT_TIMESTAMP AS [smalldatetime]) AS [CollectionDate]
	FROM [sys].[dm_db_missing_index_group_stats] gs WITH (NOLOCK)
	INNER JOIN [sys].[dm_db_missing_index_groups] ig WITH (NOLOCK) ON gs.[group_handle] = ig.[index_group_handle]
	INNER JOIN [sys].[dm_db_missing_index_details] id WITH (NOLOCK) ON ig.[index_handle] = id.[index_handle]
	INNER JOIN [sys].[databases] db WITH (NOLOCK) ON db.[database_id] = id.[database_id]
	INNER JOIN sys.objects ON id.OBJECT_ID = objects.OBJECT_ID
	WHERE  db.[database_id] = DB_ID()
	--AND schema_name([objects].[schema_id]) + '.' + [objects].[name] AS [Table] like 'dbo.MyTable%'
	ORDER BY --[Table]
		[IndexAdvantage] DESC
	OPTION (RECOMPILE);



## Sources

- [SQL Authority, Missing Index Script](https://blog.sqlauthority.com/2011/01/03/sql-server-2008-missing-index-script-download/) &mdash; from my hero Pinal Dave. Noone out-thinks or out-works Pinal. Is there an online Pinal Conf? I'd love to attend.
- [Identifyig missing indexes in sql server](https://samirbehara.com/2017/08/23/identifying-missing-indexes-in-sql-server/)
- [SQL Nuggets: How to find missing indexes](http://www.sqlnuggets.com/blog/sql-scripts-how-to-find-missing-indexes/)

## See also

- [Finding unused indexes in sql server](find_unused_indexes_in_sql_server.md)