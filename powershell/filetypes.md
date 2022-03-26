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


## Summarize Projects in a Solution

This variant finds all project files, and for their home folder, gives a summary of the files/types in that folder:


	Get-ChildItem . *.csproj -rec |
	% {
		$project = $_.Directory.Name;
		Get-ChildItem $_.Directory.FullName -rec -file |
		Where-Object { -not ($_.FullName -like '*\node_modules\*' -or
			$_.FullName -like '*\obj\*' -or
			$_.FullName -like '*\bin\*' -or
			$_.FullName -like '*\.git\*' -or
			$_.FullName -like '*\.vs\*' -or
			$_.FullName -like '*\.vscode\*' -or
			$_.FullName -like '*\packages\*' -or
			$_.FullName -like '*\.nuget\*') } |
		group-object -property { ($project) } |
		ForEach-Object {
			[PSCustomObject]@{
				Project = $project
				Size_kb = (($_.Group.Length | Measure-Object -sum).Sum  / 1kb).ToString("0.00")
				Folder_Count = ($_.Group | % {$_.Directory.FullName} | sort | get-unique | count )
				File_Types_Count = ($_.Group | % {$_.Extension} | sort | get-unique | count )
				File_Count = $_.Count
				Distinct_FileNames_Count = ($_.Group | % Name | sort | get-unique | count )
			}
		}
	} |
	sort @{Expression="File_Count";Descending=$true}  |
    format-table


`tip` One thing that I keep learning over and over, is that you must *sort* the input that you send to `get-unique`. Otherwise it returns entirely the wrong results.


## See also

- [Group objects in powershell](group_objects_in_powershell.md)