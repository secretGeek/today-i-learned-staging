# Indexing for Performance by Kimberly Tripp

This is a course I've been studying through Pluralsight:

[SQL Server: Indexing for Performance by Kimberly L. Tripp](https://www.pluralsight.com/courses/sqlserver-indexing-for-performance)

> This course will teach you how to correctly choose indexes for your environment. You'll also learn how to understand index internals, how indexes are used, and much more.

I've placed related resources here for myself:

    j learning; cd sql_server\indexing_for_performance

## Overview

Two stages:

- Query Tuning
  - i.e. you tune individual queries and come up with decent indexes for them in isolation
- Server Tuning
  - consolidate indexes for all typical queries to avoid:
    - unused indexes
    - duplicate indexes
    - too-similar indexes

## General tips (throughout course)

- When running queries to be analysed:
  - Turn on statistics io

	SET STATISTICS IO ON;

  - Turn on show plan (i.e. "show actual execution plan" button -- Kimberly calls it 'Show Plan')

- To inspect indexes:
  - DMV for index (Kimberly uses '[sys].[dm_db_index_physical_stats]' so much she just refers to it as 'the DMV')

		-- Now, use the DMV (adding index ID) to review all indexes:
		SELECT [index_id] AS [ID]
			, [index_depth] AS [D]
				, [index_level] AS [L]
				, [record_count] AS [Rows]
				, [page_count] AS [Pages]
				, [avg_page_space_used_in_percent] AS [Page:Percent Full]
				, [min_record_size_in_bytes] AS [Row:MinLen]
				, [max_record_size_in_bytes] AS [Row:MaxLen]
				, [avg_record_size_in_bytes] AS [Row:AvgLen]
		FROM [sys].[dm_db_index_physical_stats]
				(DB_ID (N'EmployeeCaseStudy')					-- Database ID
				, OBJECT_ID (N'EmployeeCaseStudy.dbo.Employee') -- Object ID
				, NULL											-- Index ID
				, NULL											-- Partition ID
				, 'DETAILED');									-- Mode
		GO

  - DBCC Ind

		EXEC ('DBCC IND ([EmployeeCaseStudy], ''[dbo].[Employee]'', 1)');
		EXEC ('DBCC IND ([EmployeeCaseStudy], ''[dbo].[Employee]'', 2)');
		EXEC ('DBCC IND ([EmployeeCaseStudy], ''[dbo].[Employee]'', 3)');

  - Show the statistics:

		DBCC SHOW_STATISTICS ('Employee', 'EmployeeZipRange1FilteredIX');

## When is index used

- Non clustered non covering Indexes are only used when selectivity &lt; about 1.5 %
  - i.e. If the query planner, expects your query to returns 2% or more of the table it would rather scan the table than seek the non c index.
  - This is because the cost of many bookmark lookups (from index leaf to actual table (which are random access access)) are slower than the even larger number of sequential reads when scanning the table.
  - And note Statistics must be up to date for those percentage estimates &lt;2% to be good enough.

		--[sys].[dm_db_index_physical_stats]

		SELECT *
		FROM sys.dm_db_index_physical_stats
				(db_id(), object_id('Charge'), 1, NULL, 'DETAILED')
		go

## When *don't* you want a covering index?

- Highly selective queries (returning a handful of records) do not need to be covered - as there are very few bookmark lookups performed.
- `Select *` does not need to be covered as u can't cover it anyway.

## Filtered index: a useful example

Imagine We only query error message when `status = error`

So we have a filtered index on `status = error` and also `error message` column (particularly if it's "left only" comparisons, i.e. `like 'x%'` not `like %x%`)

- So small you can afford to include extra columns

- Sql server will not query across two filtered sets (and join them) -

eg where status in ('error','warning') (assuming a filtered index for status 'error' and a filtered index for status 'warning'....

- Sql server won't combine those and will just scan the table instead.
- One trick is to change the query to be:
	> ...where status = 'error' ... union all ... where status = 'warning'
	as then it will combine the two sets but you have to be repetitive to do that

So you want the filtered index to be clearly the "filtered index of choice" for this query.

Should have automated statistics updating maintenance routine at a time when system is less busy.

	UPDATE STATISTICS [dbo].[Employee];

## Index consolidation

- Unused indexes - get rid of those obviously.

- Duplicates obviously only need 1. But check no one is using hints to target one of the dupes by name.

	[Kimberly's script for finding duplicates](https://www.sqlskills.com/blogs/kimberly/removing-duplicate-indexes/) (She may have a newer one by now? This one still looks like it would work on all but columnstore indexes?)

Similar - may make a "super index" and find it's still useful but less space maintenance easier to cache and stay in cache etc.

Kimberly has a replacement for `sp_helpindex` - I think this is her latest version:

- [USE THIS: sp_helpindex](https://www.sqlskills.com/blogs/kimberly/sp_helpindex-v20170228/)

## External References

- [Indexing for Performance Finding the Right Balance `PDF`](https://www.sqlskills.com/blogs/kimberly/content/binary/indexesrightbalance.pdf) &mdash; a 2004 pdf of earlier version of the course.
- [USE THIS: sp_helpindex](https://www.sqlskills.com/blogs/kimberly/sp_helpindex-v20170228/) - Kimberly' replacement for `sp_helpindex`

## See also

- [Check if Column exists, or if constraint exists or if index exists (including spatial index)](check_if_column_constraint_index_exists.md)
