# Count occurrences of string

Here's a clever utility function to count how many times a substring appears in a string...

	CREATE FUNCTION dbo.CountOccurrencesOfString
	(
		@searchString nvarchar(max),
		@searchTerm nvarchar(max)
	)
	RETURNS INT
	AS
	BEGIN
		return (LEN(@searchString)-LEN(REPLACE(@searchString,@searchTerm,'')))/LEN(@searchTerm)
	END

## Source

- [How do you count the number of occurrences of a certain substring in a SQL varchar?](https://stackoverflow.com/questions/738282/how-do-you-count-the-number-of-occurrences-of-a-certain-substring-in-a-sql-varch)