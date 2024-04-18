# Typical Chain of Actions in Powershell functions

Starting from:   A File        A Database         A functions
:::	:::	:::	     EXAMPLES      EXAMPLES           EXAMPLES

## Process with "Where"

### EXAMPLE1 File Where

Get file content, where it starts with a comment indicator

	get-content $profile | ? { $_ -match "^#" }

###	EXAMPLE2 Database Where

###	EXAMPLE3 Function Where


## Sort with "Sort" --

...via a custom property --

## For example

### With "File" and "Where"

:::	EXAMPLE

	SORT FILE WHERE CUSTOM PROPERTY RELATION VALUE SOURCE

### Get CSV and group

:::	EXAMPLE

	SORT WHERE GROUP BY CUSTOM PROPERTY

	SELECT CUSTOM PROPERTY

### AND SORT IT TOO


e.g. With "From Database" and "Sort"

### Get from Database and Format

:::	EXAMPLE

	GET FROM DB -- (Select A B C from D where E sort by F) | FORMAT-WIDE





