# Load or Save CSV with Powershell

## Save CSV to a file

Save an object as CSV with "Export-Csv"

	dir | Export-Csv dir.csv -NoTypeInformation

You may want to restrict which properties you save, e.g...

	dir | select Name, Length | Export-Csv dir.csv -NoTypeInformation

Can also convert any object to csv before doing something with it, such as writing to a file...

	dir | select Name, Length | convertto-csv -notypeinformation | out-file -append dirinfo.csv -encoding utf8;

## Append to a file - skip header!

If you're appending to a file you'll also want to skip the header row (apart from on the first write...)

	dir | select Name, Length | convertto-csv -notypeinformation | Select-Object -Skip 1 | out-file -append dirinfo.csv -encoding utf8;

## Load CSV from a file

	$myDir = import-csv "dirinfo.csv";

What type do we end up with? A custom object, with a `NoteProperty` for each column that was encountered...

	> $mydir | get-member

		 TypeName: System.Management.Automation.PSCustomObject

	Name        MemberType   Definition
	----        ----------   ----------
	Equals      Method       bool Equals(System.Object obj)
	GetHashCode Method       int GetHashCode()
	GetType     Method       type GetType()
	ToString    Method       string ToString()
	Length      NoteProperty string Length=12
	Name        NoteProperty string Name=fred.md

## Group CSV

	import-csv "dirinfo.csv" | group -property Name | sort -desc count
