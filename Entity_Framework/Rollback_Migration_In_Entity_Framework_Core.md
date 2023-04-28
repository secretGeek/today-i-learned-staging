# Rollback Migration In Entity Framework Core

In Package Manager console, with correct project (containing your DB context) selected, type:

	Update-Database <previous-migration-name>

Or at the commandline --

	dotnet ef database update <previous-migration-name>

Having done so, you roll, roll, roll your way back to that migration.


## Source(s)

- [EF Core Migration: Reversing a migration](https://www.learnentityframeworkcore.com/migrations#reversing-a-migration)

## See also

- [EF6: Rollback to a previous migration](ef6_rollback_migration.md)

