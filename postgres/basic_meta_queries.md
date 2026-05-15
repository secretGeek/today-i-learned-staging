# Basic Meta Queries in Postgres

In SQL Server I often run queries to find tables/procedures/functions, and columns.

Here are some SQL Server queries with their Postgres equivalents.


## Select tables and views with a name like "abc"

T-SQL:

```
Select top 10 Schema_Name(UID) + '.' + Name , Xtype from sysobjects where xtype in ('U','V') AND Schema_Name(UID) + '.' + Name like '%abc%'
```

Postgres:

```
SELECT
    n.nspname || '.' || c.relname AS object_name,
    c.relkind
FROM pg_class c
JOIN pg_namespace n
    ON n.oid = c.relnamespace
WHERE
    c.relkind IN ('r', 'v') -- r = table, v = view
    AND (n.nspname || '.' || c.relname) ILIKE '%abc%'
LIMIT 10;
```

Note/observe: 

- In postgress, `Like` is case-sensitive, so we use `Ilike` for an insensitive comparison.
- String concatenation uses `||`
- `Limit 10` instead of `top 10`


## Select Procedures/Functions with a name like 'abc'

T-SQL:


```
Select top 10 Schema_Name(UID) + '.' + Name , Xtype from sysobjects where xtype in ('P','AF','FS','FT','IF','TF') AND Schema_Name(UID) + '.' + Name like '%%'
```

Postgres:

```
SELECT
    n.nspname || '.' || p.proname AS object_name,
    CASE p.prokind
        WHEN 'p' THEN 'PROCEDURE'
        WHEN 'f' THEN 'FUNCTION'
        ELSE p.prokind::text
    END AS object_type
FROM pg_proc p
JOIN pg_namespace n
    ON n.oid = p.pronamespace
WHERE
    p.prokind IN ('p', 'f') -- procedures and functions
    AND (n.nspname || '.' || p.proname) ILIKE '%%'
LIMIT 10;
```


## Columns in tables or views, where the column name is like 'abc'

T-SQL:

```
Select sc.Name as [Column], Schema_Name(so.UID) + '.' + so.Name as [Table], so.Xtype from sysobjects so inner join syscolumns sc on so.id = sc.id where so.xtype in ('U','V') and sc.Name like '%abc%'
```

Postgres:

```
SELECT
    c.column_name AS "Column",
    c.table_schema || '.' || c.table_name AS "Table",
    t.table_type -- 'BASE TABLE' or 'VIEW'
FROM information_schema.columns c
JOIN information_schema.tables t
    ON c.table_schema = t.table_schema
   AND c.table_name = t.table_name
WHERE
    t.table_type IN ('BASE TABLE', 'VIEW')
    AND c.column_name ILIKE '%abc%'
ORDER BY
    c.table_schema,
    c.table_name,
    c.ordinal_position;
```

## See also

- [SQL Server: Find Tables or Columns by Name, and or Search all views functions or sprocs for a piece of text](../SQL_Server/find_view_function_or_sproc.md)
