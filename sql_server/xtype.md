# Xtype (in sysobjects)



|Xtype|Meaning|
|-----|-------|
|AF|Aggregate function (CLR)|
|C|CHECK constraint|
|D|Default or DEFAULT constraint|
|F|FOREIGN KEY constraint|
|L|Log|
|FN|Scalar function|
|FS|Assembly (CLR) scalar-function|
|FT|Assembly (CLR) table-valued function|
|IF|In-lined table-function|
|IT|Internal table|
|P|Stored procedure|
|PC|Assembly (CLR) stored-procedure|
|PK|PRIMARY KEY constraint (type is K)|
|RF|Replication filter stored procedure|
|S|System table|
|SN|Synonym|
|SQ|Service queue|
|TA|Assembly (CLR) DML trigger|
|TF|Table function|
|TR|SQL DML Trigger|
|TT|Table type|
|U|User table|
|UQ|UNIQUE constraint (type is K)|
|V|View|
|X|Extended stored procedure|


Function:

	XType in ('AF','FS','FT','IF','TF')


Further research....
	
You can find the above table via:

	
	SELECT name 
	FROM master..spt_values
	WHERE type = 'O9T'
	
...[see stackoverflow](https://stackoverflow.com/a/16243935)


## Query to filter by type of object

	$x = "Select Schema_Name(o.UID) + '.' + o.Name , o.Xtype, tt.[name]
	from sysobjects o inner join  master..spt_values tt 
	on tt.type = 'O9T' and tt.name like o.xtype + '%' collate database_default
	where
	tt.[name] like 
	'%proc%' --e.g. function table proc
	AND Schema_Name(o.UID) + '.' + o.Name like
	'%db%'"

Store it with:

	$x | kv xtype