# How do you parse a date in powershell?


# $dirDate will be defined....

	if ([DateTime]::TryParseExact($DateAsAString, "dd-MM-yyyy",
		[System.Globalization.CultureInfo]::InvariantCulture,
		[System.Globalization.DateTimeStyles]::None,
		[ref]$dirDate))