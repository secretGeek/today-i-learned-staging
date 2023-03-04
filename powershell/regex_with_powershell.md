# Regex with powershell - only a few things you need to know to get you started

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

## Regex Options With Powershell


Include 1 option...

	$options = [Text.RegularExpressions.RegexOptions]::Singleline
	$match = [regex]::Match($input, $regex, $options)

Include multiple options by using a "bitwise or" (`-bor`):


	$options = [Text.RegularExpressions.RegexOptions]::IgnoreCase -bor [Text.RegularExpressions.RegexOptions]::CultureInvariant
	$match = [regex]::Match($input, $regex, $options)


That's a lot of typing... instead, "let casting do the magic" like so:

	$options = [Text.RegularExpressions.RegexOptions]'IgnoreCase, CultureInvariant'
	$match = [regex]::Match($input, $regex, $options)

## Regex Replace with a Lambda or ScriptBlock in Powershell


	$callback = {
	  param($match)
	  'This is the image: ' + (Get-Base64 $match.Groups[1].Value)
	}

	$re = [regex]'-(\d*)-'
	$result = $re.Replace("the image is -12345-", $callback)


## Source

- [Pass regex options to PowerShell [regex] type - Stack Overflow](https://stackoverflow.com/questions/12977338/pass-regex-options-to-powershell-regex-type) -- for "options"
- [Use a function in Powershell replace](https://stackoverflow.com/questions/30666101/use-a-function-in-powershell-replace)