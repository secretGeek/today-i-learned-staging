# Finding unused indexes in sql server

Before finding (and eliminating) unused indexes, you have to know that sometimes primary keys and uniqueness indexes are not specifically used as indexes (i.e. they may not be involved in seeks/scans or lookups) but they might be useful in assisting the query planner to make wise decisions. So please don't blindly delete `PK`s or uniqueness constraints based off the results of looking at 'unused' indexes!


	SELECT
		schema_name([objects].[schema_id]) + '.' + objects.name AS [Schema.Table],
		indexes.name AS [Index],
		stats.user_seeks,
		stats.user_scans,
		stats.user_lookups,
		stats.user_updates,
		indexes.*
	FROM
		sys.dm_db_index_usage_stats stats
		INNER JOIN sys.objects ON stats.OBJECT_ID = objects.OBJECT_ID
		INNER JOIN sys.indexes ON indexes.index_id = stats.index_id AND stats.OBJECT_ID = indexes.OBJECT_ID
	WHERE
	--	stats.user_lookups = 0
	--	AND	stats.user_seeks = 0
	--	AND	stats.user_scans = 0
	--  AND
		indexes.is_primary_key = 0		-- Excludes primary keys as described above
	AND indexes.is_unique = 0			-- Excludes unique constarints are described above
	ORDER BY
		(stats.user_seeks + stats.user_scans + stats.user_lookups) asc,  
		stats.user_updates DESC



What do you expect to find when you run this query?

Most of you will find:

	Msg 300, Level 14, State 1, Line 1
	VIEW SERVER STATE permission was denied on object 'server', database 'master'.
	Msg 297, Level 16, State 1, Line 1
	The user does not have permission to perform this action.


And you may then have to either find someone who does have this permission, or get the necessary permissions added to an account you can use.


Some of you will find no data! When SQL Server service is reset, `dm_db_index_usage_stats` is cleared, so this works best after SQl Server has been up for a decent amount of time -- enough to give reasonable info about the pattern of usage for you datbase. (You can find when it was reset  using `SELECT sqlserver_start_time FROM sys.dm_os_sys_info` see [start_time](start_time.md))


If you do find results, you may see:

- For `heap` tables, the index name may be `NULL`.
- You might find completely unused indexes -- those where `user_seeks`, `user_scans` and `user_lookups` are *all* Zero. Or you may find cases where these numbers are very very small, close to zero.



## Sources

-[Nikola Dimitrijevic: How to identify and monitor unused indexes in SQL Server](https://www.sqlshack.com/how-to-identify-and-monitor-unused-indexes-in-sql-server/)



## See also

- [Find missing indexes in sql server](find_missing_indexes_in_sql_server.md)