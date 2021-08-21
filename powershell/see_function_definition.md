# See Function Definition

A quick way to see a function definition

(e.g. to see the definition of nprof...)

    dir function:nprof | % { $_.definition }

A way to search for the definition....

	Get-Command findtext |  Foreach-Object Definition

(And with my aliases...)

	which findtext | % Definition

Or

	which findtext | Select Name,Definition
