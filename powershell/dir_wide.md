# How to do the equivalent of "dir /w" in powershell?

In DOS you can use "dir/w" to show a "wide" listing of files, in multiple columns.

The nearest equivalent in powershell is:

	dir | fw -col 5

## Without aliases

	Get-ChildItem | Format-Wide -Column 5

Column is optional, but I show it because I usually run this when I want to specify columns.