# How to make a custom class


## Define a new class like that

	class JournalNode {
		[string]$NodeType;
		[Datetime]$Date;
		[string]$Text;
		[int]$LineNumber;
		[string]$SourceFile;
	}


## Construct an instance with ::new()

And then you can create it like this:

	$journalNode = [JournalNode]::new();
	$journalNode.NodeType = $nodeType;
	$journalNode.Date = $dateTime;
	$journalNode.Text = $text;
	$journalNode.LineNumber = $lineNumber;
	$journalNode.SourceFile = $fileName
	$journalNode;

-----

## See also

- [Add note property to object in pipeline](add_property_to_object_along_pipeline.md)
- [Create custom objects](custom_objects.md)