# Histograms in Powershell

You can use the group-object to do standard grouping.

This shows all of the files in the current folder, grouped into buckets according to their size.
Each bucket is 1000 bytes.

	dir |
		group-object -property { [int]($_.length / 1000) } | sort @{e={$_.Name -as [int]}} |
			format-table @{Expression={[string]([int]($_.Name) * 1000) + "-" + [string](-1+([int]($_.Name)+1) * 1000)};Label="Bucket";width=10},
				@{Expression={$_.Count};Label="Count";width=10},
				@{Expression={$_.Group};Label="Members";width=50} -autosize

*Consider* running the initial `dir` recursively with `-rec`

## Group by file type

Exclude directories (but include their files)

	dir -rec -file | group-object -property extension | sort count -desc

(An older method was to use `dir -rec | ?{ $_.PSIsContainer -ne $true } ` ... instead of `-file`)

## Bucket all files
...for looking at size of all markdown files in TIL, in buckets of 300 bytes each (but changing the bucket size is easy...)

	$bucketSize = 300; dir . *.md -rec -file |
	group -property { [int]($_.length / $bucketSize) } | sort @{e={$_.Name -as [int]}} |
		format-table @{Expression={[string]([int]($_.Name) * $bucketSize) + "-" + [string](-1+([int]($_.Name)+1) * $bucketSize)};Label="Bucket";width=10},
			@{Expression={$_.Count};Label="Count";width=10},
			@{Expression={$_.Group};Label="Members";width=50} -autosize

-----

## See also

- [SQL Server: Example query for bucketing up a bunch of values](../sql_server/histogram.md)
