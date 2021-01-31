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



## Group by multiple properties


This example is from stackoverflow (see sources)

	$grouped = $InitialListToBeGrouped | group ID, ID2
	$grouped | foreach {
			$b= $_.name -split ', '
			[pscustomobject] @{
					 ID = $b[0];ID2 = $b[1]
					'Sum Value' = ($_.group | measure value -sum).sum
			}
	}


Group my tasks by Source and Category

	$grouped = (read-stockfile | group "Category","Source");
	$grouped | foreach {
			$b= $_.name -split ', ';
			$_.Group | select *;
			[pscustomobject] @{
					 Category = $b[0];
					 Source = $b[1];
					 Count = $_.Count;
					'Sum Value' = ($_.group.Length | measure -sum).sum
			}
	}


## Source

- [stackoverflow - group by multiple properties](https://stackoverflow.com/questions/30769809/powershell-group-by-multiple-properties)