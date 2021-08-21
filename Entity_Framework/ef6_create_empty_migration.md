# EF6: Create Empty Migration

Before proceeding -- make sure you have compiled your code!

In the package manager console...

Select the `default project` (dropdown) to have the project which contains your migrations and entity config.

*ensure you have compiled the project before you proceed*

...continuing!

In the package manager console (having selected the right project, see above), run this command:

	Add-Migration "my_new_migration" -verbose

(You don't *need* the `-verbose` but i find it useful to see more output and routinely include that)

You'll receive an "empty" migration file, something like this:

	namespace MyDbProject.Migrations
	{
		using System;
		using System.Data.Entity.Migrations;

		public partial class my_new_migration : DbMigration
		{
			public override void Up()
			{
			}

			public override void Down()
			{
			}
		}
	}


In the Up and `Down` method - you might specify some raw sql, by using the `sql` command... but that's another TIL.
