# regex with powershell - only a few things you need to know to get you started

Use operators such as `-replace`, `-match` and `-split`.

	"fred" -replace "ed`$", "ida"

here is `-split`:

	"a sentence? a sentence! a sentence." -split "[!?.]"

returns:

	a sentence
	 a sentence
	 a sentence

There's `-match` and `-notmatch` and case sensitive variants: `-cmatch` and `-cnotmatch`

After `-match` is used, the variable `$matches` will hold the matches, e.g.

	"fred" -match "^fr(.*)";$matches

returns:

	True

	Name                           Value
	----                           -----
	1                              ed
	0                              fred
