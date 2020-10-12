# Add note property to object in pipeline


	function ConvertTo-Object($hashtable) 
	{
		 $object = New-Object PSObject
		 $hashtable.GetEnumerator() | 
				ForEach-Object { Add-Member -inputObject $object `
					-memberType NoteProperty -name $_.Name -value $_.Value }
		 $object
	}

	$hash = @{Name='Richard'; Status='Online'}
	ConvertTo-Object $hash | Export-Csv test.csv -NoTypeInformation

## Source

- [convert hash to PS objects in pipeline](https://community.idera.com/database-tools/powershell/ask_the_experts/f/learn_powershell_from_don_jones-24/2824/exporting-key-value-pair-using-export-csv-cmdlet)