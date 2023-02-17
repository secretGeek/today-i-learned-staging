# Count lines of code with powershell

First naive attempt...

	Get-ChildItem -Filter "*.cs" -Recurse | Get-Content | Measure-Object -line -word -character

Now -- filter out blanks and whitespace...

	Get-ChildItem -Filter "*.cs" -Recurse | Get-Content | Measure-Object -line -word -character

Comments starting with "//"

	Get-ChildItem -Filter "*.cs" -Recurse |
		Get-Content |
			? { $_.trim() -like "//*" } |
				measure

Comments starting with "/*"

	Get-ChildItem -Filter "*.cs" -Recurse |
		Get-Content |
			? { $_.trim() -like "/``**" } |
				measure

## Code minus blanks and comments

	Get-ChildItem -Filter "*.cs" -Recurse |
		Get-Content |
			? {
				$_.trim() -notlike "/``**" -and   # starts with /*
				$_.trim() -notlike "*``*/" -and   # ends with */
				$_.trim() -notlike "//*" -and     # starts with //
				$_.trim() -notlike "" } |         # blank
				measure

## Avoid node_modules and obj folders

Here are two examples of where conditions

1. Using `-notmatch`

		? { $_.FullName -notmatch "\\node_modules\\|\\obj\\" }

2. Using `-like`

		? { -not ($_.FullName -like '*\node_modules\*' -or $_.FullName -like '*\obj\*') }

3. Using `-notlike`

		Get-ChildItem -Filter "*.cs" -Recurse |
		? { $_.FullName -notlike '*\node_modules\*' -and $_.FullName -notlike '*\obj\*' } |
		Measure | % Count

## Count .cs Files in all folders

To just count the files you can use:

	Get-ChildItem -Filter "*.cs" -Recurse | measure | % count

## Count .cs files but not in node_modules or obj folder

Here are two versions -- they seem equally fast/slow to me at the moment...

	Get-ChildItem -Filter "*.cs" -Recurse |
		? { $_.FullName -notmatch "\\node_modules\\|\\obj\\" } |
		Measure | % Count

And:

	Get-ChildItem -Filter "*.cs" -Recurse |
		? { -not ($_.FullName -like '*\node_modules\*' -or $_.FullName -like '*\obj\*') } |
		Measure | % Count

## Lines of .cs code minus blanks and comments, avoiding some folders

Putting it all together:

	Get-ChildItem -Filter "*.cs" -Recurse |
		? { -not ($_.FullName -like '*\node_modules\*' -or $_.FullName -like '*\obj\*') } |
		Get-Content |
			? {
				$_.trim() -notlike "/``**" -and   # starts with /*
				$_.trim() -notlike "*``*/" -and   # ends with */
				$_.trim() -notlike "//*" -and     # starts with //
				$_.trim() -notlike "" } |         # blank
				Measure-Object -line -word -character

Or try:

	Get-ChildItem -recurse | ?{ $_.PSIsContainer -ne $true } |
	? { -not ($_.FullName -like '*\node_modules\*' -or $_.FullName -like '*\obj\*') } |
	% {

		$measureLines = (Get-Content $_ |
				? {
				$_.trim() -notlike "/``**" -and   # starts with /*
				$_.trim() -notlike "*``*/" -and   # ends with */
				$_.trim() -notlike "//*" -and     # starts with //
				$_.trim() -notlike "" } |         # blank
				Measure-Object -line -word -character);
		Add-Member -inputObject $_ -memberType NoteProperty -name "Lines" -value measureLines.Lines;
		$_;
	} group-object -property { ($_.extension) } | sort -desc Count;

## See also

- [Count Files by Type](filetypes.md)
- [Count distinct rows (in powershell)](count_distinct_rows.md)
- [Histograms in Powershell](histogram.md)
- [Group objects in powershell](group_objects_in_powershell.md)
