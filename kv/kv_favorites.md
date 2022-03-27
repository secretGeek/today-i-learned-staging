# kv favorites

I use `kv` - key value store tool - to hold some favorite little scraps of common scripts and queries.


## Summary of current folder

Summary of content of current folder. 

Shows the file types, number and size of files, and more.


	$xxxx =  @"
	Get-ChildItem -rec -file |
	Where-Object { -not (`$_.FullName -like '*\node_modules\*' -or
	`$_.FullName -like '*\obj\*' -or
	`$_.FullName -like '*\.git\*' -or
	`$_.FullName -like '*\.vs\*' -or
	`$_.FullName -like '*\.vscode\*' -or
	`$_.FullName -like '*\packages\*' -or
	`$_.FullName -like '*\.nuget\*') } |
	group-object -property { (`$_.extension) } |
	ForEach-Object {
	[PSCustomObject]@{
	Ext = `$_.Name
	Size_b = (`$_.Group.Length | Measure-Object -sum).Sum
	Count = `$_.Count
	Folders = (`$_.Group | % {`$_.Directory.FullName} | get-unique | count )
	Distinct_FileNames = (`$_.Group | % Name | get-unique | count )
	Files = (`$_.Group | % Name)
	}
	} | Sort-Object -desc Count, size_b | format-table
	"@

	kv summary $xxxx