# Group by count in KQL

Here's a classic query I always need in every technology:

	Select some_column, Count(*) as Count 
	from some_table 
	where random_column = 'X'
	group by some_column 
	order by 2 desc

In KQL the equivalent is:

	some_table
	| where random_column == "X"
	| summarize Count=count() by some_column

KQL is concise but also very powerful when it comes to aggregates.

I love how 'logical' KQL seems to be.

## Sources

- [count() - aggregation function](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/count-aggfunction)
- [summarize operator](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/summarizeoperator)

## See also

- [Linqpad: Group by](../linqpad/group_by.md)
- [Powershell: group object](../powershell/group_objects_in_powershell.md)
