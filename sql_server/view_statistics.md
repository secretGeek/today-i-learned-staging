# View statistics

This shows all of the statistics for each table, and when they were last updated, how many rows, and how many changes are detected to have occurred since the stats were updated.


	SELECT S.object_id, 
				 S.name, 
				 so.name as [Table],
				 DDSP.last_updated, 
				 DDSP.rows, 
				 DDSP.modification_counter 
	FROM   sys.stats AS S 
				 CROSS APPLY sys.dm_db_stats_properties(S.object_id, S.stats_id) AS DDSP 
				 inner join sysobjects so on so.id = s.object_id
	--WHERE 
	-- 		so.name like '%MY_TABLE_NAME%' -- Some filters you might like...
	--AND ddsp.last_updated is not null
	--AND so.Name not like 'Lookup%'
	order by DDSP.last_updated desc



## When will sql server update the stats?

I've seen a description like this:


> They will be updated (approximately) when more than 500 rows have been modified *and* the amount is around 20% or more of the entire table.

(I've found the source of this...

Uwe Ricken, at [When AUTO_UPDATE_STATISTICS Doesn’t Happen](https://www.red-gate.com/simple-talk/sql/t-sql-programming/when-auto_update_statistics-doesnt-happen/) writes:

> Statistics are judged to be outdated when, roughly, the following condition is true:
>
>	- The index / statistic has more than 500 unique entries
> - (and)
> -  `>= 500 + 20%` of cardinality values have been changed



## How to check if auto update of stats is on:

Check the `is_auto_update_stats_on` column in the `sys.databases` catalog view.

It is *on* by default and it should stay on.


Check the `is_auto_create_stats_on` column in the `sys.databases` catalog view.


It is *on* by default and it should stay on.



## How about auto tuning of databases?


By default automatic tuning is *off*. Why? Is it dodgy?


The `<automatic_tuning_option>` of 
Applies to: SQL Server (Starting with SQL Server 2017 (14.x))

Enables or disables FORCE_LAST_GOOD_PLAN


The default value is OFF.

## Looking at percents/figures for out of date stats...


Here's a (quite naive) way of (kind of) checking those heuristics mentioned above...


	SELECT 
		case 
			when
				DDSP.Rows >= 500 
				and DDSP.modification_counter >= 500
				and DDSP.modification_counter >= (DDSP.Rows / 5.0)
			then '**'
			else ''
		end as Overdue_To_Update,
		DDSP.Rows as [Rows >=500],
		DDSP.modification_counter as [Modification Counter >= 500],
		case when isnull(DDSP.Rows,0) = 0 then null else 
		((1.0 * DDSP.modification_counter) / (1.0 * DDSP.Rows)) * 100 
		end as [Mod Percent],
		S.object_id, 
		S.name, 
		so.name as [Table],
		DDSP.last_updated, 
		DDSP.rows, 
		DDSP.modification_counter
	FROM
		sys.stats AS S 
	CROSS APPLY 
		sys.dm_db_stats_properties(S.object_id, S.stats_id) AS DDSP 
	INNER JOIN 
		sysobjects so on so.id = s.object_id
	--WHERE 
	-- 		so.name like '%MY_TABLE_NAME%' -- Some filters you might like...
	--AND ddsp.last_updated is not null
	--AND so.Name not like 'MY_TABLE_TO_EXCLUDE%'
	ORDER BY
		1 desc, 
		DDSP.last_updated desc


## Further reading on sql server statistics

- [Brent Ozar: Unique Indexes and Row Modifications: Weird](https://www.brentozar.com/archive/2016/03/unique-indexes-and-row-modifications-weird/)