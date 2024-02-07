# How do you parse a date in powershell?

## Use ParseExact!

	$DateAsAString = "30-12-1905";
	$exactDate = [datetime]::ParseExact($DateAsAString,"dd-MM-yyyy",$Null)
	write-host $exactDate -f blue;

## Minimal Powershell Example for DateTime ParseExact 

	[datetime]::ParseExact("30-12-1905","dd-MM-yyyy",$Null)

## Can Use TryParseExact, but it's not at as easy from powershell

	$DateAsAString = "30-12-1905";
	$parseddate4 = get-date; # seem to have to initialize this variable...
	if ([DateTime]::TryParseExact(
		$DateAsAString,
		"dd-MM-yyyy",
		[System.Globalization.CultureInfo]::InvariantCulture,
		[System.Globalization.DateTimeStyles]::None,
		[ref]$parseddate4))
	{
		Write-Host "$parseddate4" -f green;
	} else {
		Write-Host "it was formatted correctly" -f red;
	}


## See also

- [Date format in powershell](date_format.md)
- [How Do I Get TODAY in Powershell](today.md)
- [How Do I Get the Current Time or Current Date or TODAY in Powershell](current_time.md)
