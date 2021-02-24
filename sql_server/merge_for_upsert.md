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

## Source(s)

- [SQL Server MERGE](https://www.sqlservertutorial.net/sql-server-basics/sql-server-merge/)

## See also

- [merge for upsert](../sql_server/merge_for_upsert.md)