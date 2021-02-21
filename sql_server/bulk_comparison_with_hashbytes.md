# Bulk Comparison with Hashbytes

Imagine we have two tables (or views), `TableNew` and `TableOld`, and we want to know if their data is the same or different.

Assume they have the same schema.

Further assume that their primary key is a composite key with two columns, `PK1` and `PK2`.


	With
	NEWSET as (
	SELECT
		MBT.PK1,
		MBT.PK2,
	   hashbytes('MD5',
				   (SELECT MBT.*
					FROM (VALUES(NULL))foo(bar)
					FOR xml auto)) AS [Hash]
	FROM TableNew AS MBT)
	,OLDSET as (
	SELECT
		MBT.PK1,
		MBT.PK2,
	   hashbytes('MD5',
				   (SELECT MBT.*
					FROM (VALUES(NULL))foo(bar)
					FOR xml auto)) AS [Hash]
	FROM TableOld AS MBT)
	,Comparison as (
	Select
		n.PK1,
		n.PK2,
		Case
			when o.[Hash] is null then 'Not in old set'
			when o.[Hash] != n.[Hash] then 'Changed'
			else 'Same'
		end as Summary
	from NewSet n
	left outer join OldSet o on n.PK1 = o.Pk1 and n.PK2 = o.PK2
	)
	,Comparison2 as (
	Select
		o.PK1,
		o.PK2,
		'Not in new set' as Summary
	from OldSet o
	left outer join NewSet n on n.PK1 = o.Pk1 and n.PK2 = o.PK2
	where n.PK1 is null and n.PK2 is null -- i.e. not match
	)
	Select Summary, Count(*) as [Count] from Comparison group by Summary
	UNION
	Select Summary, Count(*) as [Count] from Comparison2 group by Summary

This will give you a summary table that tells you:

* how many are in the old set but not the new (based on primary key) `Not in new set`
* how many are in the new set but not the old (based on primary key) `Not in old set`
* how many are in both sets but with different details in at least one column `Changed`
* how many are in both sets and with identical details in every column `Same`

e.g.

|Summary|Count|
|-------|-----|
|Changed|607534|
|Not in new set|56|
|Not in old set|7017|
|Same|65449|




## Problem

The maximum input to `hashbytes` -- prior to `SQL Server 2016` -- is 8000 bytes.


## Solution for versions less than SQL Server 2016


This yak took many cans of shaving cream!


You can use this function to hash `varbinary(max)` ... (note you don't specify which hash function is used... so I'm guessing it's possible that two different database instances *might* use different hash functions inside the repl hash binary... it may be configurable? but within one database instance this should work consistently...)


	master.sys.fn_repl_hash_binary(SOME_VARBINARY)

...but we don't have a var binary we have a `nvarchar(max)` !

So cast the `nvarchar(max)` to `varbinary(max)` before running the function....

	master.sys.fn_repl_hash_binary(cast(SOME_NVARCHAR_MAX as varbinary(max)))

...And that appears to work, in SSMS... but the output is actually an array of bytes, not a varchar of any sort.

I found the trick this time is to convert the result to varchar(32) with a third parameter of `2`, i.e.


	Convert(varchar(32), master.sys.fn_repl_hash_binary(cast(SOME_NVARCHAR_MAX as varbinary(max))), 2) as Hasho


So here's our function modified to work with large nvarchar's prior to `SQL Server 2016`. (I'm writing/needing this in 2020!)


	With
	NEWSET as (
	SELECT
		MBT.PK1,
		MBT.PK2,
		Convert(varchar(32), master.sys.fn_repl_hash_binary(cast((SELECT MBT.*
				FROM (VALUES(NULL))foo(bar)
				FOR xml auto) as varbinary(max))), 2) as [Hash]
		FROM TableNew AS MBT)
	,OLDSET as (
	SELECT
		MBT.PK1,
		MBT.PK2,
		Convert(varchar(32), master.sys.fn_repl_hash_binary(cast((SELECT MBT.*
				FROM (VALUES(NULL))foo(bar)
				FOR xml auto) as varbinary(max))), 2) as [Hash]
	FROM TableOld AS MBT)
	,Comparison as (
	Select
		n.PK1,
		n.PK2,
		Case
			when o.[Hash] is null then 'Not in old set'
			when o.[Hash] != n.[Hash] then 'Changed'
			else 'Same'
		end as Summary
	from NewSet n
	left outer join OldSet o on n.PK1 = o.Pk1 and n.PK2 = o.PK2
	)
	,Comparison2 as (
	Select
		o.PK1,
		o.PK2,
		'Not in new set' as Summary
	from OldSet o
	left outer join NewSet n on n.PK1 = o.Pk1 and n.PK2 = o.PK2
	where n.PK1 is null and n.PK2 is null -- i.e. not match
	)
	Select Summary, Count(*) as [Count] from Comparison group by Summary
	UNION
	Select Summary, Count(*) as [Count] from Comparison2 group by Summary