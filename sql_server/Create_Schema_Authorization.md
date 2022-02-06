# Create Schema with Authorization

When Creating schemas, if you don't specify the 'Authorization' then the 'owner' of the schema will be the user who ran the script.

So specify `DBO` for example, with a script like this:

	CREATE SCHEMA [BUSINESS] Authorization DBO

## See also

- [create schema specific role](../sql_server/create_schema_specific_role.md)
- [create active directory user on sql server](../sql_server/create_active_directory_user_on_sql_server.md)