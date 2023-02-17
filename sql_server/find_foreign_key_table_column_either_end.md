# Find a foreign key by searching for the table or column from either end

This is helpful for finding not only "what does this foreign key refer to?" but also "are there any foreign keys out there that refer to this table?"

Things you might want to customise:

- which column to sort by?
- do you want to compare to just the fk table, the pk table, the fk column, the pk column?

I've tried to make it super-easy to comment those in or out!

	Declare @searchTerm nvarchar(100) = 'Person'								-- SEARCH TERM
	Select
		schema_name(tab.schema_id) + '.' + tab.name as [fk_table],
		col.name as fk_column,
		case when fk.object_id is not null then '>-' else null end as rel,
		schema_name(pk_tab.schema_id) + '.' + pk_tab.name as [pk_table],
		pk_col.name as pk_column,
		fk_cols.constraint_column_id as Cons_Col_no,
		fk.name as fk_constraint_name
	from
		sys.tables tab
	inner join sys.columns col
			on col.object_id = tab.object_id
	left outer join sys.foreign_key_columns fk_cols
			on fk_cols.parent_object_id = tab.object_id
			and fk_cols.parent_column_id = col.column_id
	left outer join sys.foreign_keys fk
			on fk.object_id = fk_cols.constraint_object_id
	left outer join sys.tables pk_tab
			on pk_tab.object_id = fk_cols.referenced_object_id
	left outer join sys.columns pk_col
			on pk_col.column_id = fk_cols.referenced_column_id
			and pk_col.object_id = fk_cols.referenced_object_id
	where
		tab.name not like '__Migra%' -- Exclude whatever you want...
	and not fk.object_id is null
	and (
		schema_name(tab.schema_id) + '.' + tab.name like				-- fk_table
		'%' + @searchTerm + '%'
	or
		col.name like																						-- fk_column
		'%' + @searchTerm + '%'
	or
		schema_name(pk_tab.schema_id) + '.' + pk_tab.name like	-- pk_table
		'%' + @searchTerm + '%'
	or
		pk_col.name like																				-- pk_column,
		'%' + @searchTerm + '%'
	)
	order by
	-- 1																											-- fk_table
	-- 2																											-- fk_column
	-- 4																											-- pk_table
	-- 5																											-- pk_column
	4