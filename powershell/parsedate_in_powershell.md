# How do you parse a date in powershell?


## $dirDate will be defined....

## Use TryParseExact... not easy from powershell


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


## Use ParseExact... easier


	$DateAsAString = "30-12-1905";
	$exactDate = [datetime]::ParseExact($DateAsAString,"dd-MM-yyyy",$Null)
	write-host $exactDate -f blue;


## See also

- [Date format in powershell](date_format.md)