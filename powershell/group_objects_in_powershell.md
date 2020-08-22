# Group objects in powershell

Grouping is useful. I've mentioned it also in [Count distinct rows](count_distinct_rows.md), [Count Files by Type](file_types.md) and [histogram](histogram.md).

	dir -rec | 
	group-object -property { ($_.extension) } | 
	% {
		[PSCustomObject]@{
			Id = $_.Name
			Size = ($_.Group.Length| Measure -sum).Sum
			Count = $_.Count
			Files = ($_.Group | % Name)
		}
	} | sort -desc Size




