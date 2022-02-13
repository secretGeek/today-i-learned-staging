# Group objects in powershell

Grouping is useful. I've mentioned it also in [Count distinct rows](count_distinct_rows.md), [Count Files by Type](filetypes.md) and [histogram](histogram.md).

	dir -rec |
	group-object -property { ($_.extension) } |
	% {
		[PSCustomObject]@{
			Id = $_.Name
			Size = ($_.Group.Length | Measure -sum).Sum
			Count = $_.Count
			Files = ($_.Group | % Name)
		}
	} | sort -desc Size


More comprehensive version:

	Get-ChildItem -rec -file |
	Where-Object { -not ($_.FullName -like '*\node_modules\*' -or
		$_.FullName -like '*\obj\*' -or
		$_.FullName -like '*\.git\*' -or
		$_.FullName -like '*\.vs\*' -or
		$_.FullName -like '*\.vscode\*' -or
		$_.FullName -like '*\packages\*' -or
		$_.FullName -like '*\.nuget\*') } |
	group-object -property { ($_.extension) } |
	ForEach-Object {
		[PSCustomObject]@{
			Ext = $_.Name
			Size_b = ($_.Group.Length | Measure-Object -sum).Sum
			Count = $_.Count
			Folders = ($_.Group | % {$_.Directory.FullName} | get-unique | count )
			Distinct_FileNames = ($_.Group | % Name | get-unique | count )
			Files = ($_.Group | % Name)
		}
	} | Sort-Object -desc Count, size_b | format-table




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

## See also

- [Count Files by Type](filetypes.md)
- [Histograms in Powershell](histogram.md)
- [Load or Save CSV with Powershell](load_save_csv.md)
- [Count distinct rows (in powershell)](count_distinct_rows.md)
- [Count lines of code with powershell](count_lines_of_code.md)
