# Search the event log for sql server restarts with this powershell query

	get-Eventlog application | where-Object { $_.source -like "MSSQL*" -and $_.Message -like "SQL Server is starting*" }

## With alias

Or more briefly:

	get-Eventlog application | ? { $_.source -like "MSSQL*" -and $_.Message -like "SQL Server is starting*" }

## Specific date range

Or for particular message / date range

	get-Eventlog application | where-Object {
					$_.Source -like "MSSQL*"
		-and	$_.TimeGenerated -gt ([datetime]::parseexact("2021-07-01", "yyyy-MM-dd", $null))
		-and 	$_.TimeGenerated -lt ([dateTime]::parseexact("2021-07-13", "yyyy-MM-dd", $null))
		# -and $_.Message -like "SQL Server is starting*"
		} |
			select -prop timegenerated, message