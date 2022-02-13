# Count Files by Type

THis is a snippet that I use all the time, for seeing how many files of each type are in a folder/tree.

	dir -rec -Exclude .git,*node_modules* | ?{ $_.PSIsContainer -ne $true } | ? { $_.DirectoryName -notmatch "node_modules|_book|\.git|\.hg" } | group-object -property { ($_.extension) } | sort -desc Count

I explicitly exclude the `.git` and `node_modules` folders, because I am usually not interested in those.

	Get-ChildItem -rec -file |
	Where-Object { -not ($_.FullName -like '*\node_modules\*' -or
		$_.FullName -like '*\obj\*' -or
		$_.FullName -like '*\.git\*' -or
		$_.FullName -like '*\.vs\*' -or
		$_.FullName -like '*\.vscode\*' -or
		$_.FullName -like '*\packages\*' -or
		$_.FullName -like '*\.nuget\*') } |
	group-object -property { ($_.extension) } | 
		Sort-Object -desc Count

...or -- to provide more summary info about each group, such as total size of files, count of files etc.

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

## See also

- [Group objects in powershell](group_objects_in_powershell.md)