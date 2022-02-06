# Format number with padding

	(1.72).ToString("        0.00")

padleft works too...

	$n = -1.92;
	write-host ([string]$n).padleft(12," ") -f green -n

(1.72).ToString("0.000000")

Can also use the "-f" operator, like so

	foreach ($Log in $EventVwr) {
		"{0,-28} {1,-20} {2,8}" -f $Log.log, $Log.OverflowAction, $Log.MaximumKilobytes
	}

or even...

	dir | % { "{0,-65} {1,-30} {2,-30}" -f $_.Name, $_.Directory.Name, $_.Length }

## Other format cmdlets

`Format-wide` is good but somehow disappointing

	dir | format-wide -col 5

`Format-table` worth a look

	dir | format-table