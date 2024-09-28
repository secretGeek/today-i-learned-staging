# String Functions


## Reference Systems

- [Alteryx]
- [SDU]
- [SQL Server]

### Alteryx

- `Contains(String, Target, CaseInsensitive=1)`
- `CountWords(String)`
- `DecomposeUnicodeForMatch(String)`
- `EndsWith(String, Target, CaseInsensitive=1)`
- `FindString(String,Target)`
- `GetWord(String, n)`
- `Left(x, len)`
- `Length(x)`
- `LowerCase(x)`
- `MD5_ASCII(String)`
- `MD5_UNICODE(String)`
- `PadLeft (str, len, char)`
- `PadRight (str, len, char)`
- `REGEX_CountMatches(string,pattern,icase)`
- `REGEX_Match(string,pattern,icase)`
- `REGEX_Replace(string, pattern, replace,icase)`
- `Replace(Str, Target, Replacement)`
- `ReplaceChar(x, y, z)`
- `ReplaceFirst(Str, Target, Replacement)`
- `ReverseString(Str)`
- `Right(String, len)`
- `StartsWith(String, Target, CaseInsensitive=1)`
- `STRCSPN(x, y)`
- `StripQuotes(x)`
- `STRSPN(x, y)`
- `Substring(x, start, length)`
- `TitleCase(x)`
- `Trim(x, y)`
- `TrimLeft(x, y)`
- `TrimRight(x, y)`
- `Uppercase(x) Converts a string to upper case`
- `UuidCreate()`

## Sql Down Under

- `AlphabeticOnly` - Removes any non-alphabetic characters from a string
- `AlphanumericOnly` - Removes any non-alphanumeric characters from a string
- `AsciiOnly` - Removes non-ASCII characters from a string
- `CamelCase` - Converts a string to camelCase
- `CobolCase` - Converts a string to COBOL-CASE
- `CountWords` - Counts the number of words in a string
- `DigitsOnly` - Removes non-digit characters from a string
- `ExtractToken` - Extracts a specific token number from a delimited string like a CSV or TSV
- `ExtractTrigrams` - Extracts trigrams (segments of up to 3 characters) from a string for fast searching
- `ExtractTrimmedWords` - Extracts words from a string and trims them
- `InitialsFromName` - Extracts a person's initials from their name
- `InvertString` - Returns an upside down version of the string
- `KebabCase` - Converts a string to kebab-case
- `LeftPad` - Left pads a string
- `NullIfBlank` - Returns NULL if a string is blank or trims the string
- `PascalCase` - Converts a string to PascalCase
- `PercentEncode` - Encodes reserved characters that are used in HTML or URL encoding
- `PreviousNonWhitespaceCharacter` - Finds the previous non-whitespace character working backwards from the current position
- `ProperCase` - Converts a string to Proper Case
- `QuoteString` - Quotes a string
- `RightPad` - Right pads a string
- `ScreamingSnakeCase` - Converts a string to SCREAMING_SNAKE_CASE
- `SeparateByCase` - Inserts spaces in Pascal-cased or camel-cased strings
- `SingleSpaceWords` - Trims a string and replaces multiple spaces with single spaces
- `SnakeCase` - Converts a string to snake_case
- `SplitDelimitedString` - Splits a delimited string (often CSV or TSV)
- `SplitDelimitedStringIntoColumns` - Splits a delimited string (often CSV or TSV) into separate columns
- `SpongeBobSnakeCase` - Converts a string to sPoNgEbOb_sNaKeCaSe
- `StringLength` - Returns the length of a string (Properly)
- `StripDiacritics` - Strips diacritics (accents, graves, etc.) from a string
- `TitleCase` - Converts a string to Title Case
- `TrainCase` - Converts a string to Train-Case
- `Translate` - Replaces a set of characters in a string
- `TrimWhitespace` - Removes any leading or trailing space, tab, carriage return, and linefeed characters
- `XMLDecodeString` - XML decodes a string
- `XMLEncodeString` - XML encodes a string

## Sql Server

- `ASCII`	Returns the ASCII value for the specific character
- `CHAR`	Returns the character based on the ASCII code
- `CHARINDEX`	Returns the position of a substring in a string
- `CONCAT`	Adds two or more strings together
- `Concat with +`	Adds two or more strings together
- `CONCAT_WS`	Adds two or more strings together with a separator
- `DATALENGTH`	Returns the number of bytes used to represent an expression
- `DIFFERENCE`	Compares two SOUNDEX values, and returns an integer value
- `FORMAT`	Formats a value with the specified format
- `LEFT`	Extracts a number of characters from a string (starting from left)
- `LEN`	Returns the length of a string
- `LOWER`	Converts a string to lower-case
- `LTRIM`	Removes leading spaces from a string
- `NCHAR`	Returns the Unicode character based on the number code
- `PATINDEX`	Returns the position of a pattern in a string
- `QUOTENAME`	Returns a Unicode string with delimiters added to make the string a valid SQL Server delimited identifier
- `REPLACE`	Replaces all occurrences of a substring within a string, with a new substring
- `REPLICATE`	Repeats a string a specified number of times
- `REVERSE`	Reverses a string and returns the result
- `RIGHT`	Extracts a number of characters from a string (starting from right)
- `RTRIM`	Removes trailing spaces from a string
- `SOUNDEX`	Returns a four-character code to evaluate the similarity of two strings
- `SPACE`	Returns a string of the specified number of space characters
- `STR`	Returns a number as string
- `STUFF`	Deletes a part of a string and then inserts another part into the string, starting at a specified position
- `SUBSTRING`	Extracts some characters from a string
- `TRANSLATE`	Returns the string from the first argument after the characters specified in the second argument are translated into the characters specified in the third argument.
- `TRIM`	Removes leading and trailing spaces (or other specified characters) from a string
- `UNICODE`	Returns the Unicode value for the first character of the input expression
- `UPPER`	Converts a string to upper-case

## External references

- [Wikipedia: Comparison of Programming Languages: string functions](https://en.wikipedia.org/wiki/Comparison_of_programming_languages_(string_functions))
