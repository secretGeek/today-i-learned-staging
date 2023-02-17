# Case Sensitive String Comparison

Make a comparison behave in a case-sensitive manner by applying a case-sensitive collation

	Select 'Hello'
	where 'A' = 'a' COLLATE Latin1_General_CS_AS

And here's an example to count how many values in a column are 'Upper' case, versus 'Lower' case or 'Mixed' case.

Assume we're interesting in a column called 'Column1' in a table called 'Table1'

	; with Cases as (
	select
	case when UPPER(Column1) = Column1 COLLATE Latin1_General_CS_AS then 'Upper'
		 when LOWER(Column1) = Column1 COLLATE Latin1_General_CS_AS then 'Lower'
	else 'Mixed' end as Casing
	from Table1)

	Select Casing, Count(*) as [Count(*)] from Cases group by Casing


## See also

- [Use Powershell to Rename all files and folders to lower case](../Powershell/Rename_to_lower_case.md)