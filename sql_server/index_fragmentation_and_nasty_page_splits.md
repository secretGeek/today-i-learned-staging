# Index fragmentation and nasty page splits


I learned most about index fragmentation and 'nasty' page splits from Paul Randal in his pluralsight course '[SQL Server: Index Fragmentation Internals, Analysis, and Solutions]'(https://app.pluralsight.com/library/courses/sqlserver-index-fragmentation-internals-analysis-solutions/table-of-contents)

There's no point looking at every page split as some are "good page splits" -- e.g. when an append happens at the end of a table, and others are "nasty" e.g. inserts, updates deletes within an index that cause page splits.

You can see nasty page splits occur though by looking for a specific event in the transaction log. ([read more](https://www.sqlskills.com/blogs/paul/tracking-page-splits-using-the-transaction-log/))

How can you see fragmentation of your indexes?

With `sys.dm_db_index_physical_stats`

Quick guide to its usage:


	-- LIMITED option
	SELECT * FROM sys.dm_db_index_physical_stats (
		DB_ID (N'Company'),
		NULL,
		NULL,
		NULL,
		N'LIMITED');
	GO

Limited will return an answer quickly. Will not look at the leaf level of the index, so it will not know anything about page density. But it will know about fragmentation down to the leaf level (because you can see this fro the level above.)


If you have a big table and are happy to know about page density only on 1 in 100 of the pages, then the 'sampled' mode will suit you fine:



	-- And now with the SAMPLED option
	SELECT * FROM sys.dm_db_index_physical_stats (
		DB_ID (N'Company'),
		NULL,
		NULL,
		NULL,
		N'SAMPLED');
	GO


But if you have more time to wait, the 'detailed' option will show page density info for all pages in the leaf level.

	-- With DETAILED option
	SELECT * FROM sys.dm_db_index_physical_stats (
		DB_ID (N'Company'),
		NULL,
		NULL,
		NULL,
		N'DETAILED');
	GO


Even the `LIMITED` version of this query can take some time for a large and fractured index. You may not want to run it for the entire database but only for selected tables or selected indexes.

A good approach is to:

1. identify the indexes you are interested in maintaining.
2. gather info on their fragmentation, possibly over time.
3. apply the relevant sort of index repair -- a rebuild or a reorganize, (or a dropping and recreating of the index may even be warranted). Unless the index is very heavily fragmented, you can probably get away with a reorganize while the system is online.
4. Watch the fragmentation again: when it is higher than the threshold that you deem acceptable, you run another reorganize.
5. But if fragmentation grows faster than you can keep up... you may set a slightly lower fill factor on a table, before the next reorganize. (If fragmentation continues to grow faster than you can keep up with, you continue to lower the fill factor... but if you're not getting closer to a result, then more drastic changes are needed, outside the scope of this TIL)

About reorganize:

Note that although it is "online" it does still take locks, just less aggressively so. And you can run it for a little while, stop it, and allow other things to continue: it will not roll back everything it has done (as a rebuild would) -- so in that manner you could proceed a little at a time, if you must.


## Tools to help reorganize your fragmented indexes

One of the conclusions at the end of the course by Paul Randall was that the Index maintenance scripts from Ola Hallengren https://ola.hallengren.com are really the gold standard and do all of the work that would need to do if you built your own solution.

Alter index reorganize 



Checking fragmentation of a column store index is quite different:


From <https://docs.microsoft.com/en-us/sql/relational-databases/indexes/reorganize-and-rebuild-indexes?view=sql-server-ver15#to-check-the-fragmentation-of-a-columnstore-index-using->



	SELECT i.object_id,
		object_name(i.object_id) AS TableName,
		i.index_id,
		i.name AS IndexName,
		100*(ISNULL(SUM(CSRowGroups.deleted_rows),0))/NULLIF(SUM(CSRowGroups.total_rows),0) AS 'Fragmentation'
	FROM sys.indexes AS i  
	INNER JOIN sys.dm_db_column_store_row_group_physical_stats AS CSRowGroups
		ON i.object_id = CSRowGroups.object_id
		AND i.index_id = CSRowGroups.index_id
	WHERE object_name(i.object_id) = 'FactResellerSalesXL_CCI'
	GROUP BY i.object_id, i.index_id, i.name
	ORDER BY object_name(i.object_id), i.name;