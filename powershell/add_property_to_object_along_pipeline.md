# Add note property to object in pipeline

Here's an example Function that adds members to an object in a pipeline.

	function ConvertTo-Object($hashtable)
	{
		$object = New-Object PSObject
		$hashtable.GetEnumerator() |
			ForEach-Object { Add-Member -inputObject $object -memberType NoteProperty -name $_.Name -value $_.Value }
		 $object
	}

Now imagine we have this hashtable:

	$hash = @{
		Name='Richard';
		Status='Online';
		Color='Green';
		Hat='Reversed'}

If we inspect it, here is what we see:

	> $hash | format-table

	Name    Value
	----    -----
	Color   Green
	Status  Online
	Name    Richard
	Hat     Reversed

Now if we run it through our `ConvertTo-Object` function, we'll see a very different object emerge...

	> ConvertTo-Object $hash | format-table

	Color  Status  Name     Hat
	-----  ------  ----     ---
	Green  Online  Richard  Reversed

(Essentially it's been pivoted! see [sql server pivot](../sql_server/pivot.md))

And I believe I used this particular one, so our hashtable can be [exported to a csv file](load_save_csv.md).

	ConvertTo-Object $hash | Export-Csv test.csv -NoTypeInformation


## Convert custom object to hash table...


And I found that in [MarkJump](https://github.com/secretGeek/markjump) I wrote a function that is somewhat the reverse of this, and turns a custom object into a hash...


	# ConvertTo-Hash is used by Get-marks to convert the custom psObject into a hash table.
	function ConvertTo-Hash($i) {
		$hash = @{ };

		$names = $i | Get-Member -MemberType properties | Select-Object -ExpandProperty name
		if ($null -ne $names) {
			$names | ForEach-Object { $hash.Add($_, $i.$_) }
		}
		$hash;
	}

## Source

- [Convert hash to PS objects in pipeline](https://community.idera.com/database-tools/powershell/ask_the_experts/f/learn_powershell_from_don_jones-24/2824/exporting-key-value-pair-using-export-csv-cmdlet)


## See also

- [How to Make a Custom Class](how_to_make_a_custom_class.md)
- [Create Custom Objects](custom_objects.md)
- [Sql Server Pivot](../sql_server/pivot.md)
- [Load or Save CSV with Powershell](load_save_csv.md)