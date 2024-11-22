# String Functions

- [String] Alteryx
- [Strings] SDU
- [String Functions] SQL Server



## "STRING CONVERSION"


## Matrix of Formats

- Html       to     Text
- XML        to     JSON
- JSON       to     CSV
- CSV        to     Markdown
- Markdown   to     Html
- Text       to     XML

- "Higher Level" formats (less consistent)
- PDF
- Word
- Excel
- Index
- Tuple
- SQL Table Row
- Python




- PREDICATES --
- FORMATTERS --
- AGGREGATES --
- CONVERSIONS
 - encoders
 - decoders




## Casing

- `CamelCase` - Converts a string to camelCase
- `CobolCase` - Converts a string to COBOL-CASE
- `KebabCase` - Converts a string to kebab-case
- `Lower`
	- `ToLower` -
	- `LowerCase(x)`
	- `LCase(x)`
- `PascalCase` - Converts a string to PascalCase
- `ProperCase` - Converts a string to Proper Case
- `ScreamingSnakeCase` - Converts a string to SCREAMING_SNAKE_CASE
- `SentenceCase` - Converts a string to "Sentence case." --via-minima.
- `SeparateByCase` - Inserts spaces in Pascal-cased or camel-cased strings
- `SnakeCase` - Converts a string to snake_case
- `SingleSpaceWords` - Trims a string and replaces multiple spaces with single spaces
- `SpongeBobSnakeCase` - Converts a string to sPoNgEbOb_sNaKeCaSe
- `TitleCase(x)`
- `TitleCase` - Converts a string to Title Case

- `TrainCase` - Converts a string to Train-Case
- `UPPER`	Converts a string to upper-case
- `Uppercase(x) Converts a string to upper case`


- `capitalize`()	Converts the first character to upper case
- `casefold`()	Converts string into lower case



## Spacing and Alignment

- `center`()	Returns a centered string
- `expandtabs`()	Sets the tab size of the string

- `SingleSpaceWords` - Trims a string and replaces multiple spaces with single spaces
	- see also: `SeparateByCase` - Inserts spaces in Pascal-cased or camel-cased strings
- `CanonicalizeString`() - Commonly based on -- slugify
    - see also: `CanonicalizeDateTime`

## Predicates

- `Contains(String, Target, CaseInsensitive=1)`

- `endswith`()	Returns true if the string ends with the specified value
- `EndsWith(String, Target, CaseInsensitive=1)`
- `StartsWith(String, Target, CaseInsensitive=1)`


## Search and Measure

- `find`()	Searches the string for a specified value and returns the position of where it was found
- `count`()	Returns the number of times a specified value occurs in a string
- `glyphwidth`()
- `MeasureText`() -- Determines the expected display width in, characters, of a sequence of utf8 bytes.
- `substring`()
	- previously: `mid`()
- left()
- right()
- "throw / catch" (previously "onError goto")



## Strippers

- SLUGGIFY is like this -- it's a mapping to a smaller but still big enough map.

- `AlphabeticOnly` - Removes any non-alphabetic characters from a string
- `AlphanumericOnly` - Removes any non-alphanumeric characters from a string
- `AsciiOnly` - Removes non-ASCII characters from a string
- Strip

## Lookups

- `ASCII`	Returns the ASCII value for the specific character
- `CHAR`	Returns the character based on the ASCII code
- `CHARINDEX`	Returns the position of a substring in a string




- `Concat with +`	Adds two or more strings together
- `CONCAT_WS`	Adds two or more strings together with a separator
- `CONCAT`	Adds two or more strings together




- `CountWords(String)`
- `CountWords` - Counts the number of words in a string
- `DATALENGTH`	Returns the number of bytes used to represent an expression
- `DecomposeUnicodeForMatch(String)`
- `DIFFERENCE`	Compares two SOUNDEX values, and returns an integer value
- `DigitsOnly` - Removes non-digit characters from a string
- `ExtractToken` - Extracts a specific token number from a delimited string like a CSV or TSV
- `ExtractTrigrams` - Extracts trigrams (segments of up to 3 characters) from a string for fast searching
- `ExtractTrimmedWords` - Extracts words from a string and trims them
- `FindString(String,Target)`
- `FORMAT`	Formats a value with the specified format
- `GetWord(String, n)`
- `InitialsFromName` - Extracts a person's initials from their name
- `InvertString` - Returns an upside down version of the string

- `Left(x, len)`
- `LEFT`	Extracts a number of characters from a string (starting from left)
- `LeftPad` - Left pads a string
- `LEN`	Returns the length of a string
- `Length(x)`
- `LOWER`	Converts a string to lower-case
- `LowerCase(x)`
- `LTRIM`	Removes leading spaces from a string
- `MD5_ASCII(String)`
- `MD5_UNICODE(String)`
- `NCHAR`	Returns the Unicode character based on the number code
- `NullIfBlank` - Returns NULL if a string is blank or trims the string
- `PadLeft (str, len, char)`
- `PadRight (str, len, char)`
- `PATINDEX`	Returns the position of a pattern in a string
- `PercentEncode` - Encodes reserved characters that are used in HTML or URL encoding
- `PreviousNonWhitespaceCharacter` - Finds the previous non-whitespace character working backwards from the current position
- `QUOTENAME`	Returns a Unicode string with delimiters added to make the string a valid SQL Server delimited identifier
- `QuoteString` - Quotes a string
- `REGEX_CountMatches(string,pattern,icase)`
- `REGEX_Match(string,pattern,icase)`
- `REGEX_Replace(string, pattern, replace,icase)`
- `Replace(Str, Target, Replacement)`
- `REPLACE`	Replaces all occurrences of a substring within a string, with a new substring
- `ReplaceChar(x, y, z)`
- `ReplaceFirst(Str, Target, Replacement)`
- `REPLICATE`	Repeats a string a specified number of times
- `REVERSE`	Reverses a string and returns the result
- `ReverseString(Str)`
- `Right(String, len)`
- `RIGHT`	Extracts a number of characters from a string (starting from right)
- `RightPad` - Right pads a string
- `RTRIM`	Removes trailing spaces from a string
- `SOUNDEX`	Returns a four-character code to evaluate the similarity of two strings
- `SPACE`	Returns a string of the specified number of space characters
- `SplitDelimitedString` - Splits a delimited string (often CSV or TSV)
- `SplitDelimitedStringIntoColumns` - Splits a delimited string (often CSV or TSV) into separate columns
- `STR`	Returns a number as string
- `STRCSPN(x, y)`
- `StringLength` - Returns the length of a string (Properly)
- `StripDiacritics` - Strips diacritics (accents, graves, etc.) from a string
- `StripQuotes(x)`
- `STRSPN(x, y)`
- `STUFF`	Deletes a part of a string and then inserts another part into the string, starting at a specified position
- `Substring(x, start, length)`
- `SUBSTRING`	Extracts some characters from a string
- `TRANSLATE`	Returns the string from the first argument after the characters specified in the second argument are translated into the characters specified in the third argument.
- `Translate` - Replaces a set of characters in a string
- `Trim(x, y)`
- `TRIM`	Removes leading and trailing spaces (or other specified characters) from a string
- `TrimLeft(x, y)`
- `TrimRight(x, y)`
- `TrimWhitespace` - Removes any leading or trailing space, tab, carriage return, and linefeed characters
- `UNICODE`	Returns the Unicode value for the first character of the input expression
- `UuidCreate()`
- `XMLDecodeString` - XML decodes a string
- `XMLEncodeString` - XML encodes a string