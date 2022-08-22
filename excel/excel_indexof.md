# In Excel, how do you check IndexOf (or Contains) of a string?

You can't sorry. Oh wait:

## Excel "String Contains"

is:

	=ISNUMBER(SEARCH("fred",B2))

## Excel "IndexOf String"

is:

	=SEARCH("fred",B2)

## Suggestions

Excel needs more and better built-in functions.

Can extensions be added directly into the loaded namespace? What functions are missing?

Would it be better to start again with a different built in languuage.

A commandline parameter or a different exe or a different file extension.

## See also

- [Avoid `#VALUE!` with IFERROR](if_error.md)