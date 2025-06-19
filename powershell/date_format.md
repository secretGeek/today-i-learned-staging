# Date format in powershell

Simple!

    get-date -f "yyyy-MM-dd HH:mm:ss"

or...

    (get-date).ToString("yyyy-MM-dd")

or better (worse) yet

	[system.string]::format("{0:yyyy-mm-dd}", (get-date))

Formatting a list of dates...

	dir *.txt | % { $_.LastWriteTime.ToString("yyyy-MM-dd") }

## See also

- [How do you parse a date in powershell?](parsedate_in_powershell.md)
- [How Do I Get TODAY in Powershell](today.md)
- [How Do I Get the Current Time or Current Date or TODAY in Powershell](current_time.md)
- [Difference between two dates (using powershell)](diff_between_two_dates.md)
- [Add Dates in Powershell](add_date.md)