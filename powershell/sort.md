# To Sort Unique

	sort -unique

e.g.

	1..100 | % { $_ % 5} | sort -unique

## To Sort by a Property

use:

	sort -property "propertyName"

e.g. 

	get-alias -def "get*" | sort -property definition | ft -property Name, Definition

Another example:

You can sort a file's content by the length of its lines by using:

	cat $file | sort -property Length

To sort by file date descending (and pick only the top 10):

	dir | sort lastwritetime -desc | select -f 10

To sort by a secondary column, instead pass a hash table as the property.

	dir | sort -property @{Expression="lastwritetime";Descending=$true},@{Expression="Name";Descending=$false} | select -f 10

(Not quite as eloquent as you'd hope.) 




## Source

* [PowerTip: Sorting More than One Column](https://devblogs.microsoft.com/scripting/powertip-sorting-more-than-one-column/)
* []
