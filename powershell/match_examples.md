# Match Operator Examples

Match with a regular expression

	"fred" -match "^fred$"

returns `True`

But it is case insensitive by default.

## Use `-cmatch` for case sensitive regular expression matching in PowerShelll

PascalCase cmdLets should maybe follow this regex.

	"GetFunction" -cmatch "^([A-Z][a-z]+){2,}$"



## Not a match

And the opposite of `-match` and `-cmatch` are `-notmatch` and `-notcmatch`

## See also

- [Regex with powershell - only a few things you need to know to get you started](regex_with_powershell.md)