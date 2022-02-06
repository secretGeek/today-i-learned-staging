# Create dynamic custom objects

(To define an actual class see [How to make a custom class](how_to_make_a_custom_class.md))

Say you have two variables, `$name` and `$count` -- and you want to create a custom object that contains just those two properies....

	$myObject = New-Object psobject -property  @{name = $name; count = $count}

Or say you are in a pipeline, within which `$name` and `$count` become available... you want to pipe out a custom object with those two properties...

	dir *.xml | % {
		$name = $_.FullPath
		$count = $_.Length
		# ^^ just for example

		New-Object psobject -property  @{name = $name; count = $count}

		# ^^ Return our custom object... for the next actor in the pipeline to deal with...

	} | ConvertTo-CSV  -NoTypeInformation | out-file "Name_And_Count.csv"

## Similar: PSCustomObject

	[PSCustomObject]@{
		Name = $_.FullPath
		Count = $_.Length
	}

This is newer. It's slightly less typing. It can have other improvements.

## What's the difference?

> both avenues will output the data as NoteProperties in the System.Management.Automation.PSCustomObject object types
>
> &mdash;[source](https://devops-collective-inc.gitbook.io/the-big-book-of-powershell-gotchas/new-object-psobject-vs.-pscustomobject)

## See also

- [Add note property to object in pipeline](add_property_to_object_along_pipeline.md)
- [How to make a custom class](how_to_make_a_custom_class.md)