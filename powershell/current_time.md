﻿# How Do I Get the Current Time or Current Date or TODAY in Powershell

	Get-Date

...and get it formatted, version 1

	get-date -f "yyyy-MM-dd HH:mm:ss"

...and get it formatted, version 2

	(get-date).ToString("yyyy-MM-dd")

...or just get `Today` via:

	[datetime]::today

(As we are accessing the static member `today` from the class `datetime`

## See also

- [How Do I Get TODAY in Powershell](today.md)
- [Date format in powershell](date_format.md)
- [How do you parse a date in powershell?](parsedate_in_powershell.md)
