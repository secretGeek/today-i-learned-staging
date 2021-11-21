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
			? { $_.trim() -like "/``** } |
				measure

## Code minus blanks and comments

	Get-ChildItem -Filter "*.cs" -Recurse |
		Get-Content |
			? { 
				$_.trim() -notlike "/``** -and
				$_.trim() -notlike "//* -and 
				$_.trim() -notlike "" } |
				measure

## Find .cs files but not in all folders

	Get-ChildItem -Filter "*.cs" -Recurse |
