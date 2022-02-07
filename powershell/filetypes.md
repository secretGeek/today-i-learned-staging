# Count Files by Type

THis is a snippet that I use all the time, for seeing how many files of each type are in a folder/tree.

	dir -rec -Exclude .git,*node_modules* | ?{ $_.PSIsContainer -ne $true } | ? { $_.DirectoryName -notmatch "node_modules|_book|\.git|\.hg" } | group-object -property { ($_.extension) } | sort -desc Count

I explicitly exlude the `.git` and `node_modules` folders, because I am usually not interested in those.

To **include** node modules...

	dir -rec -Exclude .git | ?{ $_.PSIsContainer -ne $true } | ? { $_.DirectoryName -notmatch "\.git" } | group-object -property { ($_.extension) } | sort -desc Count

Here's another version with a Size property (which is a sum of the length)

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

Here's same, explicitly excluding `.git` and `node_modules` again.

	dir -rec -Exclude .git,*node_modules*,.hg |
	? { $_.PSIsContainer -ne $true } | ? { $_.DirectoryName -notmatch "node_modules|\.git|\.hg" } |
	group-object -property { ($_.extension) } |
	% {
		[PSCustomObject]@{
			Id = $_.Name
			Size = ($_.Group.Length| Measure -sum).Sum
			Count = $_.Count
			Files = ($_.Group | % Name)
		}
	} | sort -desc Size

## See also

- [Group objects in powershell](group_objects_in_powershell.md)