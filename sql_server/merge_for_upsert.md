# Using Merge for upsert (update or insert)

SQL Server supports a Merge statement which lets you Update, Insert, Delete (for example) based on matching conditions.

	MERGE dbo.People p
		USING dbo.People_staging s
	ON (p.person_id = t.person_id)
	WHEN MATCHED
		THEN UPDATE SET
			p.name = s.name
			p.pets_name = s.pets_name
			p.pet_type = s.pet_type
	WHEN NOT MATCHED BY TARGET
		THEN INSERT (person_id, name, pets_name, pet_type)
			 VALUES (s.person_id, s.name, s.pets_name, s.pet_type)
	WHEN NOT MATCHED BY SOURCE
		THEN DELETE;

That's fun and alll....

I want "when not matched by source then update with condition"

	DECLARE @SummaryOfChanges TABLE(ID int, Change VARCHAR(20));

	MERGE dbo.People p
		USING (Select *
			from dbo.People_staging s
			where s.ImportDate = @SomeDate) s  -- example shows filtering what's importable...
	ON (p.person_id = t.person_id)
	WHEN MATCHED
		THEN UPDATE SET
			  p.name = s.name
			, p.pets_name = s.pets_name
			, p.pet_type = s.pet_type
		-- , p.FirstSeen = s.Seen -- leave 'firstseen' alone...
			, p.Last_Seen = s.Seen
			, p.MissingSince = null -- not missing now
	WHEN NOT MATCHED BY TARGET
		THEN INSERT (person_id, name, pets_name, pet_type, [FirstSeen], [LastSeen], [MissingSince])
			 VALUES (s.person_id, s.name, s.pets_name, s.pet_type, s.[Seen], s.[Seen], null)
	WHEN NOT MATCHED BY SOURCE
		THEN SET o.[MissingSince] = GetDate()
	OUTPUT $action INTO @SummaryOfChanges;

	DECLARE @InsertCount INT, @UpdateCount INT, @DeleteCount INT
	SELECT @InsertCount = COUNT(*) FROM @SummaryOfChanges WHERE Change = 'INSERT'
	SELECT @UpdateCount = COUNT(*) FROM @SummaryOfChanges WHERE Change = 'UPDATE'
	SELECT @DeleteCount = COUNT(*) FROM @SummaryOfChanges WHERE Change = 'DELETE'

	SET @Message = 'Inserted ' + CAST(@InsertCount AS VARCHAR(4)) + ' new rows, updated ' + CAST(@UpdateCount AS VARCHAR(4)) + ' existing rows, deleted ' + CAST(@DeleteCount AS VARCHAR(4)) + ' non-matched rows.'
	RAISERROR (@Message, 0, 1) WITH NOWAIT

## Source(s)

- [SQL Server MERGE](https://www.sqlservertutorial.net/sql-server-basics/sql-server-merge/)

## See also

- [Merge for upsert](../sql_server/merge_for_upsert.md)
