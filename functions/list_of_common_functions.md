# Function Research

## Categories Comparison

## Categories Appearing in More than one place

(Really these are the categories I'm most interested in)

### String Functions

- [String] Alteryx
- [Strings] SDU
- [String Functions] SQL Server

### Convert Functions

- [Conversion] Alteryx
- [Data Conversion Functions] SDU

### DateTime Functions

- [DateTime] Alteryx
- [Dates and Times] SDU

### Math Functions

- [Math] Alteryx
- [Math: Bitwise] Alteryx

### Spatial Functions

- [Spatial] Alteryx  (others will have these!)

### Filter Functions

- [Conditional] Alteryx

## Appearing in just one place (so far)

- [File] Alteryx
- [Finance] Alteryx

- [Min/Max] Alteryx
- [Operators] Alteryx
- [Specialized] Alteryx (examples??)

- [Database Utilities] SDU
- [Reporting Services Functions] SDU
- [Scripting Functions] SDU (this is vague?)
- [Performance Tuning Functions and Procedures] SDU
- [Utility Views] SDU

## Appendix A - Other Systems' Function Lists

Background research (step 0) -- Listing functions (grouped) from any places that are easy to grab lists from.

- [alteryx]
- [sql down under tools]
- [online csv tools]
- [SSRS]
- [sql server]
- [excel]
- [python]
- [various cheat sheets etc]
- [terraform]
- [Sql Server]

### Alteryx

- [alteryx](https://help.alteryx.com/2018.2/Reference/Functions.htm)

#### Categories (Alteryx)

- [Conditional]
- [Conversion]
- [DateTime]
- [File]
- [Finance]
- [Math]
- [Math: Bitwise]
- [Min/Max]
- [Operators]
- [Spatial]
- [Specialized]
- [String]

#### Conditional

-`IF` -`IF Else` -`IIF` -`Switch`

#### Conversion

- `BinToInt` - Converts the binary string s to an integer. (Limited to 53 bits.)
- `CharFromInt`(i) - Returns the Unicode® character that matches the input number.
- `CharToInt`(S) - Returns the number that matches the input Unicode® character.
- `ConvertFromCodepage`(s, codePage): Translates text from a code page to Unicode. See Code Pages.
- `ConvertToCodepage`(s, codePage): Translates text from Unicode® encoding to a specific code page. See Code Pages.
- `HexToNumber`(x): Converts a HEX string to a number. (Limited to 53 bits.)
- `IntToBin`(x): Converts x to a binary string
- `IntToHex`(x): Converts x to a hexadecimal string
- `ToNumber`(x, bIgnoreErrors, keepNulls, decimalSeparator): Converts a string parameter to a number. ToNumber accepts strings that can be interpreted as scientific notation double precision. By default, the period is used as the decimal separator.
- `ToString`(x, numDec, addThousandsSeparator, decimalSeparator): Converts a numeric parameter to a string using numDec decimal places. By default, the period is used as the decimal separato

#### DateTime

- `DateTimeAdd`(dt,i,u): Adds a specific interval to a DateTime value.
  - dt: DateTime data, expressed as a selected column or a specified DateTime value between quotes.
  - i: Positive or negative integer of time to add or subtract.
  - u: DateTime unit, specified between quotes: years, months, days, hours, minutes, or seconds.
- `DateTimeDay`(dt): Return the numerical value for the day of the month in a DateTime value.
- `DateTimeDiff`(dt1,dt2,u): Subtract the second argument from the first and return it as an integer difference. The duration is returned as - a number, not a string, in the specified time units.
- `DateTimeFirstOfMonth`(): Returns the first day of the month, at midnight.
- `DateTimeFormat`(dt,f): Convert DateTime data from ISO format to a format for use by another application. Output to a string data type.
- `DateTimeHour`(dt): Return the hour portion of the time in a DateTime value.
- `DateTimeLastOfMonth`(): Returns the last day of the current month, with the clock set to one second before the end of the day (23:59:59).
- `DateTimeMinutes`(dt): Return the minutes portion of the time in a DateTime value.
- `DateTimeMonth`(dt): Return the numerical value for the month in a DateTime value.
- `DateTimeNow`(): Returns the current system date and time.
- `DateTimeParse`(dt,f): Converts a date string with the specified format to the standard ISO format yyyy-mm-dd HH:MM:SS.
- `DateTimeSeconds`(dt): Return the seconds portion of the time in a DateTime value.
- `DateTimeStart`(): Returns the date and time when the current workflow started running.
- `DateTimeToday`(): Returns today’s date.
- `DateTimeToLocal`(dt): Converts a UTC DateTime to the local system time zone.
- `DateTimeToUTC`(dt): Converts a DateTime (in local system time zone) to UTC.
- `DateTimeTrim`(dt,t): Remove unwanted portions of a DateTime and return the modified DateTime .
- `DateTimeYear`(dt): Return the numerical value for the year in a DateTime value.
- `ToDate`(x): Converts a string, number, or DateTime to a Date.
- `ToDateTime`(x): Converts a string, number, or Date to a DateTime.

#### File

- `FileAddPaths`(Path1, Path2): Adds two file path parts, making sure there is exactly one \ (backslash) between the two paths.
- `FileExists`(Path): Returns true if the file exists, false if it does not.
- `FileGetDir`(Path): Returns the directory portion of the path.
- `FileGetExt`(Path): Returns the extension of the path, including the . (period).
- `FileGetFileName`(Path): Returns the name portion of the path, without the extension.

#### Finance

- `FinanceCAGR`(BeginningValue, EndingValue, NumYears): Compound Annual Growth Rate: The geometric mean growth rate on an annualized basis.
- `FinanceEffectiveRate`(NominalRate, PaymentsPerYear): Effective Annual Interest Rate: The interest rate on a loan or financial product - restated from the nominal interest rate as an interest rate with annual compound interest payable in arrears
- `FinanceFV`(Rate, NumPayments, PaymentAmount, PresentValue, PayAtPeriodBegin): Future Value of an Investment: The value of an asset at a - specified time in the future assuming a certain interest rate or rate of return.
- `FinanceFVSchedule`(Principle, Year1Rate, Year2Rate): Future Value Schedule: The future value of an initial principal after applying a - series of interest rates to an investment.
- `FinanceIRR`(Value1, Value2): Internal Rate of Return: The interest rate at which the costs of the investment lead to the benefits of the - investment. This means that all gains from the investment are inherent to the time value of money and that the investment has a zero net - present value at this interest rate.
- `FinanceMIRR`(FinanceRate, ReinvestRate, Value1, Value2): Modified Internal Rate of Return: A modification of the internal rate of return - that aims to resolve some problems with the IRR. The MIRR is a financial measure of an investment's attractiveness.
- `FinanceMXIRR`(FinanceRate, ReinvestRate, Value1, Date1, Value2, Date2): Modified Internal Rate of Return of an investment with dates
- `FinanceNominalRate`(EffectiveRate, PaymentsPerYear): Nominal Annual Interest Rate: An interest rate is called nominal if the frequency of - compounding (such as a month) is not identical to the basic time unit (normally a year).
- `FinanceNPER`(Rate, PaymentAmount, PresentValue, FutureValue, PayAtPeriodBegin): Number of periods for an investment or loan
- `FinanceNPV`(Rate, Value1, Value2): Net Present Value of an investment: Measures the excess or shortfall of cash flows, in present value - terms, once financing charges are met.
- `FinancePMT`(Rate, NumPayments, PresentValue, FutureValue, PayAtPeriodBegin): Calculates payments on a loan
- `FinancePV`(Rate, NumPayments, PaymentAmount, FutureValue, PayAtPeriodBegin): Present Value of an Investment: The value on a given date of - a future payment or series of future payments, discounted to reflect the time value of money and other factors such as investment risk.
- `FinanceRate`(NumPayments, PaymentAmount, PresentValue, FutureValue, PayAtPeriodBegin): Returns the interest rate (per period)
- `FinanceXIRR`(Value1, Date1, Value2, Date2): Internal Rate of Return of an investment with dates
- `FinanceXNPV`(Rate, Value1, Date1, Value2, Date2): Net Present Value of an investment with dates

#### Math

- `ABS`(x): Absolute value of (x). It is the distance between 0 and a number. The value is always positive.
- `ACOS`(x): Arc - Cosine of (x) Returns the arccosine, or inverse cosine, of a number. The arccosine is the angle whose cosine is (x). The returned angle is given in radians in the range 0 (zero) to pi. The number (x) must be between -1 and 1.
- `ASIN`(x): Arc - Sine of (x) Returns the arcsine, or inverse sine, of a number. The arcsine is the angle whose sine is (x). The returned angle is given in radians in the range -pi/2 to pi/2.
- `ATAN`(x): Arc - Tangent of (x) Returns the arctangent, or inverse tangent, of a number. The arctangent is the angle whose tangent is (x). The returned angle is given in radians in the range -pi/2 to pi/2.
- `ATAN2`(y, x): Arc - Tangent of (y/x) Returns the arctangent of y and x.
- `Average`(n1,...): Average of a list of numbers.
- `CEIL`(x): Returns smallest integer greater than or equal to (x). Works like the RoundUp function in Excel.
- `COS`(x): Cosine of (x)
- `COSH`(x) : Hyperbolic Cosine of (x)
- `DISTANCE`(from_Lat,from_Lon, to_Lat, to_Lon): Returns distance from (lat1,Lon1) to (lat2,lon2)
- `EXP`(x): Returns e^x
- `FLOOR`(x): Returns largest integer less than or equal to (x)
- `LOG`(x): Natural logarithm of (x)
- `LOG10`(x): Base 10 logarithm of (x)
- `Median`(...): Calculates the median out of one or more (possibly unsorted) values.
- `Mod`(n,d): Modulo of n divided by d (integer operation). The Modulo operation finds the remainder of one integer (n) divided by a divisor integer (d). If (n) is positive, the result is positive. If (n) is negative, the result is negative. If decimal values are used, the decimal is truncated. This can result in a "Divided by 0" error if the divisor is a decimal less than 1.
- `PI`(): Returns the value of the constant PI to 15 digits of accuracy
- `POW`(x, e): Returns (x) raised to the (e) power
- `RAND`(): Returns a random number between 0 and 1
- `RandInt`(n): Returns a random integer between 0 and the specified parameter
- `Round`(x, mult): Returns (x) rounded to nearest multiple of (mult)
- `SIN`(x): Sine of (x)
- `SINH`(x): Hyperbolic Sine of (x)
- `SmartRound`(x): Returns (x) rounded to nearest multiple of a value determined dynamically based on the size of (x)
- `SQRT`(x): Square root of (x)
- `TAN`(x): Tangent of (x)
- `TANH`(x): Hyperbolic Tangent of (x)

#### Math: Bitwise

- `BinaryAnd`(n,m): Returns a binary of n and m. The result is 1 if both n and m are 1, and 0 otherwise. If 0 is equated with false, and 1 with true the BinaryAnd operation works like a logical And.
- `BinaryNot`(n): Returns a Binary Not of n
- `BinaryOr`(n,m): Returns a Binary Or of n and m
- `BinaryXOr`(n,m): Returns a Binary XOr of n and m
- `ShiftLeft`(n,b): Left shifts n (as integer) by b bits
- `ShiftRight`(n,b): Right shifts n (as integer) by b bits

#### Min/Max

- `Bound`(x, min, max): If (x < min) return min; else if (x > max) return max; else return x
- `Max`(v0, v1,..., vn): Returns the maximum value from the list.
- `MaxIDX`(v0, v1,..., vn): Returns the 0 based index of the maximum value from the list.
- `Min`(v0, v1,..., vn): Returns the minimum value from the list.
- `MinIDX`(v0, v1,..., vn): Returns the 0 based index of the minimum value from the list.

#### Operators

- `/*Comment*/`: Block Comment: Allows you to add comments to an expression editor (within the expression line) without interfering with the expression.
- `//Comment`: Single Line Comment: Allows you to add comments to an expression editor without interfering with the expression.
- `Addition +`: Addition
- `Boolean AND &&`: Boolean AND: Used to combine two Boolean values. The result is also a Boolean value. The result is true if both of the combined values are true, and the result is false if either of the combined values is false.
- `Boolean AND - Keyword`: Boolean AND: Used to combine two Boolean values. The result is also a Boolean value. The result is true if both of the combined values are true, and the result is false if either of the combined values is false.
- `Boolean NOT !`: Boolean NOT: Accepts one input. If that input is TRUE, it returns FALSE. If that input is FALSE, it returns TRUE.
- `Boolean NOT - Keyword`: Boolean NOT: Accepts one input. If that input is TRUE, it returns FALSE. If that input is FALSE, it returns TRUE.
- `Boolean OR - Keyword`: Boolean OR: If either (or both) of the two values it checks are TRUE, then it returns TRUE.
- `Boolean OR ||`: Boolean OR: If either (or both) of the two values it checks are TRUE, then it returns TRUE.
- `Close Parenthesis )`: Close Parenthesis
- `Division /`: Division
- `Equal To =`: Equal To
- `Greater Than >`: Greater Than
- `Greater Than Or Equal >=`: Greater Than Or Equal
- `Less Than <`: Less Than
- `Less Than Or Equal <=`: Less Than Or Equal
- `Multiplication *`: Multiplication
- `Not Equal To !=`: Not Equal To
- `Open Parenthesis (`: Open Parenthesis
- `Subtraction -`: Subtraction
- `value IN (...) - Keyword`: Test Value in List: Determines if a given value matches any value in a subquery or a list.
- `value NOT IN (...) - Keyword`: Test Value Not in List: Determines if a given value matches any value not in a subquery or a list.

#### Spatial

- `ST_Area`(object, units): Returns the area in the specified units of the spatial object. (numeric data value)
- `ST_Boundary`(object): Returns the boundary of the spatial object. (polyline spatial object indicating the boundary of the input polygon)
- `ST_BoundingRectangle`(object, ...): Returns the bounding rectangle of the spatial object. (polygon spatial object)
- `ST_Centroid`(object): Returns the centroid of the spatial object. (point spatial object)
- `ST_CentroidX`(object): Returns the longitude of the centroid of the spatial object (numeric data value)
- `ST_CentroidY`(object): Returns the latitude of the centroid of the spatial object (numeric data value)
- `ST_Combine`(object1, object2,...): Combines the spatial objects. (spatial object)
- `ST_Contains`(object1,object2): Returns True if object1 contains object2. (Boolean value)
- `ST_ConvexHull`(object1,...): Returns the convex hull of the object(s). (spatial object)
- `ST_CreateLine`(point1, point2...): Creates a line by connecting the specified points and lines in a sequence. (spatial object)
- `ST_CreatePoint`(x,y): Returns a spatial object containing the specified longitude and latitude coordinates. (spatial object)
- `ST_CreatePolygon`(obj1, obj2...): Creates a polygon by connecting the specified points and lines in a sequence. (spatial object)
- `ST_Cut`(object1,object2): Returns the result of cutting object1 from object 2. (spatial object)
- `ST_Dimension`(object): Returns the dimension of the spatial object. The spatial dimension is the minimum number of coordinates needed to specify every point that makes up the spatial object. Point objects return a value of 0, Line objects return a value of 1, and Polygon objects return a value of 2. (numeric data value)
- `ST_Distance`(object1, object2, units): Returns the distance in specified units from object1 to object2. Supported units are Miles (Mi), Kilometers (KM), Meters, Feet. (numeric data value)
- `ST_EndPoint`(object): Returns the last point of the spatial object. (point spatial object)
- `ST_Intersection`(object1, object2,...): Returns the intersection of the specified spatial objects. (spatial object)
- `ST_Intersects`(object1, object2...): Returns True if the spatial objects intersect. (Boolean value)
- `ST_InverseIntersection`(object1, object2...): Returns the inverse intersection of the specified spatial objects. (spatial object)
- `ST_Length`(object, units): Returns the linear length of the spatial object. (numeric data value)
- `ST_MaxX`(object): Returns the maximum longitude of the spatial object. (numeric data value)
- `ST_MaxY`(object): Returns the maximum latitude of the spatial object. (numeric data value)
- `ST_MinX`(object): Returns the minimum longitude of the spatial object. (numeric data value)
- `ST_MinY`(object): Returns the minimum latitude of the spatial object. (numeric data value)
- `ST_NumParts`(object): Returns the number of parts in the spatial object. (numeric data value)
- `ST_NumPoints`(object): Returns the number of points in the spatial object. (numeric data value)
- `ST_ObjectType`(object): Returns the spatial object type as a string value. (string data value)
- `ST_PointN`(object, n): Returns the Nth point in the spatial object. (point spatial object)
- `ST_RandomPoint`(object): Returns a random point within the spatial object. (point spatial object)
- `ST_Relate`(object1,object2,relation): Returns True if the objects satisfy the provided DE-9IM relation. (Boolean value)
- `ST_StartPoint`(object): Returns the first point in the spatial object. (spatial object)
- `ST_Touches`(object1, object2): Returns True if object 1 touches object 2. (Boolean value)
- `ST_TouchesOrIntersects`(object1, object2): Returns True if object 1 touches or Intersects object 2. (Boolean value)
- `ST_Within`(object1, object2): Returns True if object 1 is contained by object 2. (Boolean value)

#### Specialized

- `EscapeXMLMetacharacters`(String)
- `GetVal`(index, v0,...vn): Returns the value (v0,..., vn) specified by the 0-based [index].
- `GetEnvironmentVariable`(Name)
- `Message`(messageType, message, returnValue) Use with a conditional statement to output a message to the message log and update column data with a specified value when a condition is met. The message type and text is shown in the Results window. If logging is enabled, the output log file also resembles this information. See Results Window and Output Log File.
- `NULL`(): Returns a Null value
- `RangeMedian`(...): Calculates the median from a series of aggregated ranges. See Range Median.
- `ReadRegistryString`(Key, ValueName, DefaultValue="): Returns a value from the registry.
- `Soundex`(string): Returns the Soundex of the String. Soundex creates a code based on the first character in the string plus three characters based on the following:
- `Soundex_Digits`(string): Returns the first four digits or the Soundex if none. If there are digits (numbers) in the String, the first four digits are returned. If there are no digits, the Soundex code is returned.
- `TOPNIDX`(N, v0, v1, ..., vn): Returns the 0 based index of the Nth from the maximum value from the list. With N==0, it is the same as MaxIdx(...). N is the starting point, v0 is the indexed field (subsequent Variables are optional), and vn is the goal.
- `UrlEncode`(String): Encodes string as a web legal URL

#### String

- `Contains`(String, Target, CaseInsensitive=1): Searches for the occurrence of a particular string within a string. Returns a TRUE or FALSE if the string matches the pattern. It is defaulted to case insensitive. The CONTAINS function is case insensitive while the FINDSTRING function is case sensitive.
- `CountWords`(String): Returns the count of words in the specified String. Words are defined by characters separated by a space.
- `DecomposeUnicodeForMatch`(String): Removes accents and expands compound characters while converting to narrow. This function takes a Unicode® string and translates it to a lower case, narrow character string. All accents and other decorations will be removed. This function is useful for matching only. It is not considered a normalized string.
- `EndsWith`(String, Target, CaseInsensitive=1): Checks if a string ends with a particular string. Returns a TRUE or FALSE if the string matches the pattern. It is defaulted to case insensitive. The EndsWith function is case insensitive while the FindString function is case sensitive.
- `FindString`(String,Target): Searches for the occurrence of a particular string (Target) within another string (String) and returns the numeric position of its occurrence in the string. Returns the 0 based index of the first occurrence of Target in String. Returns -1 if no occurrence.
- `GetWord`(String, n): Returns the Nth (0-based) word in the String. Words are defined as a collection of characters separated by a space. 0-based index, means the first word is at the 0 position.
- `Left`(x, len): Returns the first [len] characters of the string (x). If len is less than 0 or greater than the length of x, x remains unchanged.
- `Length`(x) : Returns the length the string (x).
- `LowerCase`(x): Converts a string to lower case
- `MD5_ASCII`(String): Calculates the MD5 hash of the string. The string is expected to be only ASCII characters. Unicode® characters are turned into ? before calculating the MD5 hash.
- `MD5_UNICODE`(String): Calculates the MD5 hash of the string.
- `PadLeft` (str, len, char): Pads the string to the left with the specified character to the specified length. If the padding “char” is more than one character long, only the first character will be used.
- `PadRight` (str, len, char): Pads the string to the right with the specified character to the specified length. If the padding “char” is more than one character long, only the first character will be used.
- `REGEX_CountMatches`(string,pattern,icase): Returns the count of matches within the string to the pattern. The icase is an optional parameter. When specified, the case must match. By default icase=1 meaning ignore case. If set to 0, the case must match. Consult the Boost Regex Perl Regular Expression Syntax page to make the building of the expression easier.
- `REGEX_Match`(string,pattern,icase): Searches a string for an occurrence of a regular expression. Tells if the string matches the pattern from the first character to the end. To look for something that does not necessarily start at the beginning of the string, start the pattern with '._'. To look for something that does not necessarily go all the way to the end of the string, end the pattern with '._'. Consult the Boost Regex Perl Regular Expression Syntax page for more information on how to properly construct a regular expression. icase is an optional parameter. When specified, the case must match. By default icase=1 meaning ignore case. If set to 0, the case must match.
- `REGEX_Replace`(string, pattern, replace,icase): Allows replacement of text using regular expressions and returns the string resulting from the RegEx find pattern and replace string. All occurrences of the match are replaced, not just the first. Consult the Boost Regex Perl Regular Expression Syntax page to make the building of the expression easier. The replace parameter can be either a specified value as shown below, or a marked group, such as "$1". icase is an optional parameter. When specified, the case must match. By default icase=1 meaning ignore case. If set to 0, the case must match.
- `Replace`(Str, Target, Replacement): Returns the string (Str) after replacing each occurrence of the String (Target) with the String (Replacement).
- `ReplaceChar`(x, y, z): Returns the string (x) after replacing each occurrence of the character (y) with the character(z). If the replacement character (z) is a string with more than one character, only the first one is used. If (z) is empty, each character (x) that matches any character in (y) is simply removed.
- `ReplaceFirst`(Str, Target, Replacement): Returns the string (Str) after replacing the first occurrence of the string (Target) with the string (Replacement).
- `ReverseString`(Str): Reverses all the characters in the string.
- `Right`(String, len): Returns the last (len) characters of the string. If len is less than 0 or greater than the length of String, the string remains unchanged.
- `StartsWith`(String, Target, CaseInsensitive=1): Checks if a string starts with a particular string. Returns a TRUE or FALSE if the string matches the pattern. It is defaulted to case insensitive. The StartsWith function is case insensitive while the FindString function is case sensitive.
- `STRCSPN`(x, y): Returns the length of the initial segment of the string (x) consisting of characters NOT in the string (y)
- `StripQuotes`(x): Removes a matched set of quotation marks or apostrophes from the ends of the string
- `STRSPN`(x, y): Returns the length of the initial segment of the string [x] consisting of characters in the string [y]
- `Substring`(x, start, length): Returns the substring of (x) starting at (start), stopping after(length), if provided
- `TitleCase`(x) : Converts a string to Title case
- `Trim`(x, y): Removes the character(s) in the string y from the ends of the string x. Y is optional and defaults to trimming white space. Notice in the TRIM function examples the specified characters are trimmed. It doesn't matter what order the characters are in.
- `TrimLeft`(x, y): Removes character in the string y from the beginning of the string x. Y is optional and defaults to trimming white space
- `TrimRight`(x, y): Removes character in the string y from the end of the string x. Y is optional and defaults to trimming white space While you may be passing in a string of characters to trim, the TRIM functions do not respect the order of the characters; it treats the string as a "list." Therefore it will trim ALL of the characters in the list. If you are looking to replace a string, use a REPLACE function or a REGEX function in your expression.
- `Uppercase`(x) Converts a string to upper case
- `UuidCreate`(): Creates a Unique identifier.

### sql down under tools

- [Sql Downunder sdu tools](https://sqldownunder.com/sdu-tools) by Greg Low

#### Categories (SDU)

- Strings
- Dates and Times
- Data Conversion Functions
- Database Utilities
- Reporting Services Functions
- Scripting Functions
- Performance Tuning Functions and Procedures
- Utility Views

#### Strings

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

#### Dates and Times

- `AddWeekdays` - Adds a number of weekdays to a date
- `CalculateAge` - Calculates the age of anything based upon a target date
- `ChineseNewYearAnimalName` - Calculates the zodiac animal name for a given year
- `ChineseYears` - View that returns details about Chinese years
- `DateDiffNoWeekends` - Determines the number of days between two dates, excluding weekends
- `DateDimensionColumns` - Returns columns often used in data warehouse date dimensions
- `DateDimensionPeriodColumns` - Returns columns often used in date warehouse period dimensions
- `DateOfChineseNewYear` - Calculates the date of Chinese New Year for a given year
- `DateOfEasterSunday` - Calculates the date of (Christian) Easter Sunday for a given year
- `DateOfOrthodoxEaster` - Calculates the date of (Orthodox) Easter Sunday for a given year
- `DatesBetween` - Function that returns the list of dates between two dates
- `DatesBetweenNoWeekends` - Function that returns the list of dates between two dates excluding weekends
- `DatesInPeriod` - Function that returns the list of dates for a number of periods
- `DateTime2ToUnixTime` - Converts datetime2 values to Unix time
- `DateToJulianDayNumber` - Converts a date to a Julian day number
- `DayNumberOfMonth` - Returns the nth instance of a specific day for a month
- `DaysInMonth` - Returns the number of days in a specific month
- `EndOfFinancialYear` - Calculates the end of a financial year date based upon a starting month
- `EndOfMonth` - Calculates the end of a month
- `EndOfWeek` - Calculates the end of a week
- `EndOfWorkingWeek` - Calculates the end of a working week
- `EndOfYear` - Calculates the end of a year
- `GetDateDimension` - Returns a data warehouse date dimension for a specified range of dates
- `GetTimePeriodDimension` - Returns a data warehouse time dimension for a given day
- `IsLeapYear` - Determines if a year is a leap year
- `IsWeekday` - Determines if a day is a weekday
- `IsWeekend` - Determines if a day is a weekend
- `JulianDayNumberToDate` - Converts a Julian day number to a date
- `NearestWeekday` - Calculates the nearest specified day of the week to a date
- `StartOfFinancialYear` - Calculates the start of the financial year for a specified starting month
- `StartOfMonth` - Calculates the start of a month
- `StartOfWeek` - Calculates the start of a week
- `StartOfWorkingWeek` - Calculates the start of a working week
- `StartOfYear` - Calculates the start of a year
- `TimePeriodDimensionColumns` - Returns the columns often used in a data warehouse time dimension
- `TimePeriodsBetween` - Returns a list of time periods of a specified size between two times
- `TimezoneOffsetToHours` - Converts a timezoneoffset to a decimal number of hours
- `UnixTimeToDateTime2` - Converts a Unix time to a datetime2 value
- `WeekdayOfMonth` - Returns the nth weekday of a month (e.g. 2nd Tuesday)
- `WeekdayOfSameWeek` - Returns the specified weekday for a given week

#### Data Conversion Functions

- `Base64ToVarbinary` - Converts a base 64 value to varbinary
- `CharToHexadecimal` - Converts a character to a hexadecimal string
- `CurrentSessionDecimalSeparator` - Determines the decimal separator for the current session
- `CurrentSessionThousandsSeparator` - Determines the thousands separator for the current session
- `HexCharStringToChar` - Converts a hexadecimal string to a character
- `HexCharStringToInt` - Converts a hexadecimal string to an int
- `NumberAsText` - Converts a number to English words (like appeared on checks/cheques)
- `NumberToRomanNumerals` - Converts a number to Roman numerals as a string
- `ROT13` - Applies ROT13 encoding/decoding of a string
- `SecondsToDuration` - Converts a number of seconds to a SQL Server duration string
- `SQLServerVersionForCompatibilityLevel` - Converts a SQL Server database compatibility level to a version
- `SQLVariantInfo` - Returns information about a sql_variant value
- `TruncateTrailingZeroes` - Converts a decimal value to a string without trailing zeroes
- `VarbinaryToBase64` - Converts a varbinary value to base 64
- `Database` and Table Comparison Tools - GetDBSchemaCoreComparison
- `Checks` the schema of two databases, looking for basic differences - GetTableSchemaComparison
- `Checks` the schema of two tables, looking for basic differences - General Purpose Functions
- `IsIPv4Address` - Determines if a string has a valid IPv4 address format
- `NULLIfZero` - Returns NULL if the input value is zero otherwise decimal(18, 2) output
- `ProductVersionComponents` - Extracts the components of a product version
- `ProductVersionToBuild` - Extracts the build from a build number (product version)
- `ProductVersionToMajorVersion` - Extracts a product major version from a build number (product version)
- `ProductVersionToMinorVersion` - Extracts a product minor version from a build number (product version)
- `ProductVersionToRelease` - Extracts a product release from a build number (product version)
- `SQLServerVersion` - Returns the SQL Server version as a string
- `SDUToolsVersion` - Returns the version of SDU Tools
- `TableOfNumbers` - Returns a specified set of numbers from a starting value

#### Database Utilities

- `AnalyzeTableColumns` - Metadata and distinct values for columns in a table
- `CalculateTableLoadingOrder` - Determines the order to load tables based upon foreign keys
- `CheckInstantFileInitializationState` - Determines if IFI is enabled
- `ClearServiceBrokerTransmissionQueue` - Clears the contents of the transmission queue for service broker
- `CreateLinkedServerToAzureSQLDatabase` - Creates a linked server to an Azure SQL Database
- `CreateSQLLoginWithSIDFromDB` - Avoids SID mismatch problems by creating a login with the SID taken from a database
- `DropTemporaryTableIfExists` - Drops a temporary table if it exists
- `EmptySchema` - Removes all objects from within a schema
- `EmptySchemaInCurrentDatabase` - Removes all objects from within a schema in the current database (useful for Azure SQL Database)
- `ExecuteCommandInEachDB` - Executes a command in each database
- `ExecuteJobAndWaitForCompletion` - Executes a SQL Agent job and waits for it to complete
- `FindStringWithinADatabase` - Searches for any occurrence of a string within a database (useful for checking masking)
- `IsJobRunning` - Checks if a SQL Agent job is currently running
- `IsLockedPagesInMemoryEnabled` - Checks if the Lock Pages in Memory setting is enabled
- `IsXActAbortOn` - Checks if XACT_ABORT is currently in the session
- `ListAllDataTypesInUse` - Lists all data types in use in the database
- `ListColumnsAndDataTypes` - Lists all columns and their data types for a database
- `ListDisabledIndexes` - Lists disabled indexes
- `ListEmptyUserTables` - Lists user tables that are empty
- `ListForeignKeyColumns` - Lists foreign keys and their columns
- `ListForeignKeys` - Lists foreign keys
- `ListIncomingForeignKeys` - Lists incoming foreign keys (targets of foreign keys)
- `ListIndexes` - Lists indexes
- `ListMismatchedDatabaseCollations` - Lists databases with collations different to the server
- `ListMismatchedDataTypes` - Lists columns with the same name that are defined differently across a database
- `ListNonIndexedForeignKeys` - Lists foreign keys not supported by an index
- `ListPotentialDateColumns` - Lists columns names as dates but not date data type
- `ListPotentialDateColumnsByValue` - Lists columns declared as having date and time values but only holding dates
- `ListPrimaryKeyColumns` - Lists primary keys and their columns
- `ListSubsetIndexes` - Lists indexes that are subsets (or duplicates) of other indexes
- `ListUnusedIndexes` - Lists indexes declared but not used
- `ListUseOfDeprecatedDataTypes` - Lists columns declared with deprecated data types
- `ListUserHeapTables` - Lists user tables with no clustering key
- `ListUserTableAndIndexSizes` - Lists the size of tables and their indexes
- `ListUserTableSizes` - Lists the size of user tables
- `ListUserTablesWithNoPrimaryKey` - Lists user tables that have no declared primary key
- `PrintMessage` - Print a message without delay
- `ReadCSVFile` - Reads CSV or TSV file with up to 50 columns
- `ReseedSequenceBeyondTableValues` - Finds the highest value used by a sequence in any table and sets its next value beyond that
- `RetrustCheckConstraints` - Retrusts check constraints that are flagged as untrusted
- `RetrustForeignKeys` - Retrusts foreign keys that are flagged as untrusted
- `ServerMaximumDBCompatibilityLevel` - Determines the maximum DB compatibilty level for a server
- `SetAnsiNullsOnForTable` - Fix the Ansi Nulls setting for a table created with it off
- `SetAnsiNullsQuotedIdentifierForStoredProcedures` - Set Ansi Nulls and quoted identifier settings for stored procedures
- `SetDatabaseCompatibilityLevelForAllDatabases` - Sets the database compatibility level for all databases
- `ShowBackupCompletionEstimates` - Estimate when a backup will complete
- `ShowCurrentBlocking` - Show blocking currently occurring in the database
- `Sleep` - Sleep for a number of seconds (non-blocking)
- `UpdateStatistics` - Update statistics within a database

#### Reporting Services Functions

- `RSCatalogTypes` - Lists different types of catalog objects
- `RSListContentItems` - Lists all items stored in RS along with their types and paths
- `RSListUserAccess` - Lists RS users and their roles
- `RSListUserAccessToContent` - Lists RS users and their access to content

#### Scripting Functions

- `ExecuteOrPrint` - Executes and/or prints SQL Server code (deals with longer values than PRINT does)
- `FormatDataTypeName` - Converts a data type, maximum length, precision, and scale to the standard format
- `PGObjectName` - Converts a Pascal-cased or camel-cased SQL Server object name to one that could be useful in other databases like PostgreSQL
- `ScriptDatabaseObjectPermissions` - Scripts object permissions for a database
- `ScriptDatabaseUsers` - Scripts users in a database
- `ScriptServerPermissions` - Scripts object permissions for a SQL Server
- `ScriptServerRoleMembers` - Scripts role members for server roles
- `ScriptSQLLogins` - Scripts SQL logins along with security IDs (SIDs)
- `ScriptTable` - Scripts a table with many options, including alternate name and schema
- `ScriptTableAsUnpivot` - Scripts a table as an unpivoted query or view
- `ScriptUserDefinedDatabaseRolePermissions` - Scripts user defined database role permissions
- `ScriptUserDefinedDatabaseRoles` - Scripts user defined database roles
- `ScriptUserDefinedServerRolePermissions` - Scripts user defined server role permissions
- `ScriptUserDefinedServerRoles` - Scripts user defined server roles
- `ScriptWindowsLogins` - Scripts Windows logins

#### Performance Tuning Functions and Procedures

- `AnalyzePerformanceTuningTrace` - Analyzes the queries found in a loaded trace file
- `CapturePerformanceTuningTrace` - Capture a performance tuning trace file
- `DeExecuteSQLString` - Converts an sp_executesql string to a query
- `ExtractSQLTemplate` - Extracts a normalized SQL query from a parameterized query
- `LastParameterStartPosition` - Helper function for finding parameters in an sp_executesql query
- `LoadPerformanceTuningTrace` - Loads a captured performance tuning trace

#### Utility Views

- `Countries` - List of the world's countries
- `Currencies` - List of the world's currencies
- `CurrenciesByCountry` - List of currencies used by each country
- `FutureReservedWords` - List of SQL Server future reserved words
- `LatestSQLServerBuilds` - List of the latest builds for each version of SQL Server
- `LoginTypes` - List of SQL Server login types
- `NonDefaultSystemConfigurationOptions` - List of SQL Server configurations not currently set to default values
- `ODBCReservedWords` - List of ODBC reserved words
- `OperatingSystemConfiguration` - Lists the configuration of the current operating system
- `OperatingSystemLocales` - List of operating system locales
- `OperatingSystemSKUs` - List of operating system SKUs
- `OperatingSystemVersions` - List of operating system versions
- `ReservedWords` - List of SQL Server reserved words
- `SQLServerProductVersions` - List of SQL Server product versions and builds
- `SystemConfigurationOptionDefaults` - List of SQL Server system configuration default values
- `SystemDataTypeNames` - List of SQL Server system data type names
- `SystemWords` - List of SQL Server reserved words and future reserved words
- `UserTypes` - List of SQL Server user types

### online csv tools

- [online csv tools](https://onlinecsvtools.com/)

Here's some things they have (those these are all standalone...)

- [Append a CSV Column](https://onlinecsvtools.com/append-csv-columns)
- [Change CSV Delimiter](https://onlinecsvtools.com/change-csv-delimiter)
- [Convert Base64 to CSV](https://onlinecsvtools.com/convert-base64-to-csv)
- [Convert CSV Cols to Rows](https://onlinecsvtools.com/convert-csv-columns-to-rows)
- [Convert CSV Rows to Cols](https://onlinecsvtools.com/convert-csv-rows-to-columns)
- [Convert CSV to Base64](https://onlinecsvtools.com/convert-csv-to-base64)
- [Convert CSV to JSON](https://onlinecsvtools.com/convert-csv-to-json)
- [Convert CSV to Text Columns](https://onlinecsvtools.com/convert-csv-to-text)
- [Convert CSV to TSV](https://onlinecsvtools.com/convert-csv-to-tsv)
- [Convert CSV to XML](https://onlinecsvtools.com/convert-csv-to-xml)
- [Convert CSV to YAML](https://onlinecsvtools.com/convert-csv-to-yaml)
- [Convert JSON to CSV](https://onlinecsvtools.com/convert-json-to-csv)
- [Convert Text Columns to CSV](https://onlinecsvtools.com/convert-text-to-csv)
- [Convert TSV to CSV](https://onlinecsvtools.com/convert-tsv-to-csv)
- [Convert XML to CSV](https://onlinecsvtools.com/convert-xml-to-csv)
- [Convert YAML to CSV](https://onlinecsvtools.com/convert-yaml-to-csv)
- [Delete a CSV Column](https://onlinecsvtools.com/delete-csv-columns)
- [Extract a CSV Column](https://onlinecsvtools.com/extract-csv-columns)
- [Insert a CSV Column](https://onlinecsvtools.com/insert-csv-columns)
- [Prepend a CSV Column](https://onlinecsvtools.com/prepend-csv-columns)
- [Replace a CSV Column](https://onlinecsvtools.com/replace-csv-columns)
- [Swap CSV Columns](https://onlinecsvtools.com/swap-csv-columns)
- [Transpose CSV](https://onlinecsvtools.com/transpose-csv)
- [Trim CSV Columns](https://onlinecsvtools.com/trim-csv-columns)
- [Truncate CSV Columns](https://onlinecsvtools.com/truncate-csv-columns)
- [URL-decode CSV](https://onlinecsvtools.com/url-decode-csv)
- [URL-encode CSV](https://onlinecsvtools.com/url-encode-csv)

### SSRS

### sql server

### excel

#### various cheat sheets etc

### python

#### Categories

- String Functions

#### String Functions (Python)

- `capitalize`()	Converts the first character to upper case
- `casefold`()	Converts string into lower case
- `center`()	Returns a centered string
- `count`()	Returns the number of times a specified value occurs in a string
- `encode`()	Returns an encoded version of the string
- `endswith`()	Returns true if the string ends with the specified value
- `expandtabs`()	Sets the tab size of the string
- `find`()	Searches the string for a specified value and returns the position of where it was found
- `format`()	Formats specified values in a string
- `format_map`()	Formats specified values in a string
- `index`()	Searches the string for a specified value and returns the position of where it was found
- `isalnum`()	Returns True if all characters in the string are alphanumeric
- `isalpha`()	Returns True if all characters in the string are in the alphabet
- `isdecimal`()	Returns True if all characters in the string are decimals
- `isdigit`()	Returns True if all characters in the string are digits
- `isidentifier`()	Returns True if the string is an identifier
- `islower`()	Returns True if all characters in the string are lower case
- `isnumeric`()	Returns True if all characters in the string are numeric
- `isprintable`()	Returns True if all characters in the string are printable
- `isspace`()	Returns True if all characters in the string are whitespaces
- `istitle`()	Returns True if the string follows the rules of a title
- `isupper`()	Returns True if all characters in the string are upper case
- `join`()	Joins the elements of an iterable to the end of the string
- `ljust`()	Returns a left justified version of the string
- `lower`()	Converts a string into lower case
- `lstrip`()	Returns a left trim version of the string
- `maketrans`()	Returns a translation table to be used in translations
- `partition`()	Returns a tuple where the string is parted into three parts
- `replace`()	Returns a string where a specified value is replaced with a specified value
- `rfind`()	Searches the string for a specified value and returns the last position of where it was found
- `rindex`()	Searches the string for a specified value and returns the last position of where it was found
- `rjust`()	Returns a right justified version of the string
- `rpartition`()	Returns a tuple where the string is parted into three parts
- `rsplit`()	Splits the string at the specified separator, and returns a list
- `rstrip`()	Returns a right trim version of the string
- `split`()	Splits the string at the specified separator, and returns a list
- `splitlines`()	Splits the string at line breaks and returns a list
- `startswith`()	Returns true if the string starts with the specified value
- `strip`()	Returns a trimmed version of the string
- `swapcase`()	Swaps cases, lower case becomes upper case and vice versa
- `title`()	Converts the first character of each word to upper case
- `translate`()	Returns a translated string
- `upper`()	Converts a string into upper case
- `zfill`()	Fills the string with a specified number of 0 values at the beginning

#### File Functions

- `close`()	Closes the file
- `detach`()	Returns the separated raw stream from the buffer
- `fileno`()	Returns a number that represents the stream, from the operating system's perspective
- `flush`()	Flushes the internal buffer
- `isatty`()	Returns whether the file stream is interactive or not
- `read`()	Returns the file content
- `readable`()	Returns whether the file stream can be read or not
- `readline`()	Returns one line from the file
- `readlines`()	Returns a list of lines from the file
- `seek`()	Change the file position
- `seekable`()	Returns whether the file allows us to change the file position
- `tell`()	Returns the current file position
- `truncate`()	Resizes the file to a specified size
- `writable`()	Returns whether the file can be written to or not
- `write`()	Writes the specified string to the file
- `writelines`()	Writes a list of strings to the file

#### Built-in Functions

- `abs`()	Returns the absolute value of a number
- `all`()	Returns True if all items in an iterable object are true
- `any`()	Returns True if any item in an iterable object is true
- `ascii`()	Returns a readable version of an object. Replaces none-ascii characters with escape character
- `bin`()	Returns the binary version of a number
- `bool`()	Returns the boolean value of the specified object
- `bytearray`()	Returns an array of bytes
- `bytes`()	Returns a bytes object
- `callable`()	Returns True if the specified object is callable, otherwise False
- `chr`()	Returns a character from the specified Unicode code.
- `classmethod`()	Converts a method into a class method
- `compile`()	Returns the specified source as an object, ready to be executed
- `complex`()	Returns a complex number
- `delattr`()	Deletes the specified attribute (property or method) from the specified object
- `dict`()	Returns a dictionary (Array)
- `dir`()	Returns a list of the specified object's properties and methods
- `divmod`()	Returns the quotient and the remainder when argument1 is divided by argument2
- `enumerate`()	Takes a collection (e.g. a tuple) and returns it as an enumerate object
- `eval`()	Evaluates and executes an expression
- `exec`()	Executes the specified code (or object)
- `filter`()	Use a filter function to exclude items in an iterable object
- `float`()	Returns a floating point number
- `format`()	Formats a specified value
- `frozenset`()	Returns a frozenset object
- `getattr`()	Returns the value of the specified attribute (property or method)
- `globals`()	Returns the current global symbol table as a dictionary
- `hasattr`()	Returns True if the specified object has the specified attribute (property/method)
- `hash`()	Returns the hash value of a specified object
- `help`()	Executes the built-in help system
- `hex`()	Converts a number into a hexadecimal value
- `id`()	Returns the id of an object
- `input`()	Allowing user input
- `int`()	Returns an integer number
- `isinstance`()	Returns True if a specified object is an instance of a specified object
- `issubclass`()	Returns True if a specified class is a subclass of a specified object
- `iter`()	Returns an iterator object
- `len`()	Returns the length of an object
- `list`()	Returns a list
- `locals`()	Returns an updated dictionary of the current local symbol table
- `map`()	Returns the specified iterator with the specified function applied to each item
- `max`()	Returns the largest item in an iterable
- `memoryview`()	Returns a memory view object
- `min`()	Returns the smallest item in an iterable
- `next`()	Returns the next item in an iterable
- `object`()	Returns a new object
- `oct`()	Converts a number into an octal
- `open`()	Opens a file and returns a file object
- `ord`()	Convert an integer representing the Unicode of the specified character
- `pow`()	Returns the value of x to the power of y
- `print`()	Prints to the standard output device
- `property`()	Gets, sets, deletes a property
- `range`()	Returns a sequence of numbers, starting from 0 and increments by 1 (by default)
- `repr`()	Returns a readable version of an object
- `reversed`()	Returns a reversed iterator
- `round`()	Rounds a numbers
- `set`()	Returns a new set object
- `setattr`()	Sets an attribute (property/method) of an object
- `slice`()	Returns a slice object
- `sorted`()	Returns a sorted list
- `@staticmethod`()	Converts a method into a static method
- `str`()	Returns a string object
- `sum`()	Sums the items of an iterator
- `super`()	Returns an object that represents the parent class
- `tuple`()	Returns a tuple
- `type`()	Returns the type of an object
- `vars`()	Returns the __dict__ property of an object
- `zip`()	Returns an iterator, from two or more iterators

### terraform

- [Terraform functions](https://www.terraform.io/docs/language/functions/)

#### Numeric Functions

- `abs`
- `ceil`
- `floor`
- `log`
- `max`
- `min`
- `parseint`
- `pow`
- `signum`

#### String Functions (terraform)

- `chomp`
- `format`
- `formatlist`
- `indent`
- `join`
- `lower`
- `regex`
- `regexall`
- `replace`
- `split`
- `strrev`
- `substr`
- `title`
- `trim`
- `trimprefix`
- `trimsuffix`
- `trimspace`
- `upper`

#### Collection Functions

- `alltrue`
- `anytrue`
- `chunklist`
- `coalesce`
- `coalescelist`
- `compact`
- `concat`
- `contains`
- `distinct`
- `element`
- `flatten`
- `index`
- `keys`
- `length`
- `list`
- `lookup`
- `map`
- `matchkeys`
- `merge`
- `range`
- `reverse`
- `setintersection`
- `setproduct`
- `setsubtract`
- `setunion`
- `slice`
- `sort`
- `sum`
- `transpose`
- `values`
- `zipmap`

#### Encoding Functions

- `base64decode`
- `base64encode`
- `base64gzip`
- `csvdecode`
- `jsondecode`
- `jsonencode`
- `textdecodebase64`
- `textencodebase64`
- `urlencode`
- `yamldecode`
- `yamlencode`

#### Filesystem Functions

- `abspath`
- `dirname`
- `pathexpand`
- `basename`
- `file`
- `fileexists`
- `fileset`
- `filebase64`
- `templatefile`

#### Date and Time Functions

- `formatdate`
- `timeadd`
- `timestamp`

#### Hash and Crypto Functions

- `base64sha256`
- `base64sha512`
- `bcrypt`
- `filebase64sha256`
- `filebase64sha512`
- `filemd5`
- `filesha1`
- `filesha256`
- `filesha512`
- `md5`
- `rsadecrypt`
- `sha1`
- `sha256`
- `sha512`
- `uuid`
- `uuidv5`

#### IP Network Functions

- `cidrhost`
- `cidrnetmask`
- `cidrsubnet`
- `cidrsubnets`

#### Type Conversion Functions

- `can`
- `defaults`
- `tobool`
- `tolist`
- `tomap`
- `tonumber`
- `toset`
- `tostring`
- `try`

### SQL Server

#### String Functions (SQL Server)

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

### Javascript

Categories here are technical not thematic...

- [Constructor]
- [Static methods]
- [Instance properties]
- [Instance methods]
- [HTML wrapper methods] (deprecated)

#### Constructor

- `String()` Creates a new String object. It performs type conversion when called as a function, rather than as a constructor, which is usually more useful.

#### Static methods

- `String.fromCharCode(num1 [, ...[, numN]])` - Returns a string created by using the specified sequence of Unicode values.
- `String.fromCodePoint(num1 [, ...[, numN)` - Returns a string created by using the specified sequence of code points.
- `String.raw()` - Returns a string created from a raw template string.

#### Instance properties

- `String.prototype.length` - Reflects the length of the string. Read-only.

#### Instance methods

- `String.prototype.at(index)` - Returns the character (exactly one UTF-16 code unit) at the specified index. Accepts negative integers, which count back from the last string character.
- `String.prototype.charAt(index)` - Returns the character (exactly one UTF-16 code unit) at the specified index.
- `String.prototype.charCodeAt(index)` - Returns a number that is the UTF-16 code unit value at the given index.
- `String.prototype.codePointAt(pos)` - Returns a nonnegative integer Number that is the code point value of the UTF-16 encoded code point starting at the specified pos.
- `String.prototype.concat(str [, ...strN ])` - Combines the text of two (or more) strings and returns a new string.
- `String.prototype.includes(searchString [, position])` - Determines whether the calling string contains searchString.
- `String.prototype.endsWith(searchString [, length])` - Determines whether a string ends with the characters of the string searchString.
- `String.prototype.indexOf(searchValue [, fromIndex])` - Returns the index within the calling String object of the first occurrence of searchValue, or -1 if not found.
- `String.prototype.lastIndexOf(searchValue [, fromIndex])` - Returns the index within the calling String object of the last occurrence of searchValue, or -1 if not found.
- `String.prototype.localeCompare(compareString [, locales [, options]])` - Returns a number indicating whether the reference string compareString comes before, after, or is equivalent to the given string in sort order.
- `String.prototype.match(regexp)` - Used to match regular expression regexp against a string.
- `String.prototype.matchAll(regexp)` - Returns an iterator of all regexp's matches.
- `String.prototype.normalize([form])` - Returns the Unicode Normalization Form of the calling string value.
- `String.prototype.padEnd(targetLength [, padString])` - Pads the current string from the end with a given string and returns a new string of the length targetLength.
- `String.prototype.padStart(targetLength [, padString])` - Pads the current string from the start with a given string and returns a new string of the length targetLength.
- `String.prototype.repeat(count)` - Returns a string consisting of the elements of the object repeated count times.
- `String.prototype.replace(searchFor, replaceWith)` - Used to replace occurrences of searchFor using replaceWith. searchFor may be a string or Regular Expression, and replaceWith may be a string or function.
- `String.prototype.replaceAll(searchFor, replaceWith)` - Used to replace all occurrences of searchFor using replaceWith. searchFor may be a string or Regular Expression, and replaceWith may be a string or function.
- `String.prototype.search(regexp)` - Search for a match between a regular expression regexp and the calling string.
- `String.prototype.slice(beginIndex[, endIndex])` - Extracts a section of a string and returns a new string.
- `String.prototype.split([sep [, limit] ])` - Returns an array of strings populated by splitting the calling string at occurrences of the substring sep.
- `String.prototype.startsWith(searchString [, length])` - Determines whether the calling string begins with the characters of string searchString.
- `String.prototype.substring(indexStart [, indexEnd])` - Returns a new string containing characters of the calling string from (or between) the specified index (or indeces).
- `String.prototype.toLocaleLowerCase( [locale, ...locales])

		The characters within a string are converted to lowercase while respecting the current locale.
		For most languages, this will return the same as toLowerCase().

- `String.prototype.toLocaleUpperCase( [locale, ...locales])

		The characters within a string are converted to uppercase while respecting the current locale.
		For most languages, this will return the same as toUpperCase().

- `String.prototype.toLowerCase()-` Returns the calling string value converted to lowercase.
- `String.prototype.toString()` - Returns a string representing the specified object. Overrides the Object.prototype.toString() method.
- `String.prototype.toUpperCase()` - Returns the calling string value converted to uppercase.
- `String.prototype.trim()` - Trims whitespace from the beginning and end of the string. Part of the ECMAScript 5 standard.
- `String.prototype.trimStart()` - Trims whitespace from the beginning of the string.
- `String.prototype.trimEnd()` - Trims whitespace from the end of the string.
- `String.prototype.valueOf()` - Returns the primitive value of the specified object. Overrides the Object.prototype.valueOf() method.
- `String.prototype.@@iterator()` - Returns a new iterator object that iterates over the code points of a String value, returning each code point as a String value.

#### HTML wrapper methods

**Deprecated** Avoid these methods! They are of limited use, as they provide only a subset of the available HTML tags and attributes.

- `String.prototype.anchor()` `<a name="name">` (hypertext target)
- `String.prototype.big()` `<big>`
- `String.prototype.blink()` `<blink>`
- `String.prototype.bold()` `<b>`
- `String.prototype.fixed()` `<tt>`
- `String.prototype.fontcolor()` `<font color="color">`
- `String.prototype.fontsize()` `<font size="size">`
- `String.prototype.italics()` `<i>`
- `String.prototype.link()` `<a href="url">` (link to URL)
- `String.prototype.small()` `<small>`
- `String.prototype.strike()` `<strike>`
- `String.prototype.sub()` `<sub>`
- `String.prototype.sup()` `<sup>`

#### Thematics Listing

The following listing of javascript functions is by theme not by technique of invocation.

#### String Functions (JavaScript)

- `charAt()`	Returns the character at the specified index (position)
- `charCodeAt()`	Returns the Unicode of the character at the specified index
- `concat()`	Joins two or more strings, and returns a new joined strings
- `endsWith()`	Checks whether a string ends with specified string/characters
- `fromCharCode()`	Converts Unicode values to characters
- `includes()`	Checks whether a string contains the specified string/characters
- `indexOf()`	Returns the position of the first found occurrence of a specified value in a string
- `lastIndexOf()`	Returns the position of the last found occurrence of a specified value in a string
- `localeCompare()`	Compares two strings in the current locale
- `match()`	Searches a string for a match against a regular expression, and returns the matches
- `repeat()`	Returns a new string with a specified number of copies of an existing string
- `replace()`	Searches a string for a specified value, or a regular expression, and returns a new string where the specified values are replaced
- `search()`	Searches a string for a specified value, or regular expression, and returns the position of the match
- `slice()`	Extracts a part of a string and returns a new string
- `split()`	Splits a string into an array of substrings
- `startsWith()`	Checks whether a string begins with specified characters
- `substr()`	Extracts the characters from a string, beginning at a specified start position, and through the specified number of character
- `substring()`	Extracts the characters from a string, between two specified indices
- `toLocaleLowerCase()`	Converts a string to lowercase letters, according to the host's locale
- `toLocaleUpperCase()`	Converts a string to uppercase letters, according to the host's locale
- `toLowerCase()`	Converts a string to lowercase letters
- `toString()`	Returns the value of a String object
- `toUpperCase()`	Converts a string to uppercase letters
- `trim()`	Removes whitespace from both ends of a string
- `valueOf()`	Returns the primitive value of a String object

#### Math Functions (JavaScript)

##### Math Object Properties

- `E`	Returns Euler's number (approx. 2.718)
- `LN2`	Returns the natural logarithm of 2 (approx. 0.693)
- `LN10`	Returns the natural logarithm of 10 (approx. 2.302)
- `LOG2E`	Returns the base-2 logarithm of E (approx. 1.442)
- `LOG10E`	Returns the base-10 logarithm of E (approx. 0.434)
- `PI`	Returns PI (approx. 3.14)
- `SQRT1_2`	Returns the square root of 1/2 (approx. 0.707)
- `SQRT2`	Returns the square root of 2 (approx. 1.414)

##### Math Methods

- `abs(x)`	Returns the absolute value of x
- `acos(x)`	Returns the arccosine of x, in radians
- `acosh(x)`	Returns the hyperbolic arccosine of x
- `asin(x)`	Returns the arcsine of x, in radians
- `asinh(x)`	Returns the hyperbolic arcsine of x
- `atan(x)`	Returns the arctangent of x as a numeric value between -PI/2 and PI/2 radians
- `atan2(y, x)`	Returns the arctangent of the quotient of its arguments
- `atanh(x)`	Returns the hyperbolic arctangent of x
- `cbrt(x)`	Returns the cubic root of x
- `ceil(x)`	Returns x, rounded upwards to the nearest integer
- `clz32(x)`	Returns the number of leading zeros in a 32-bit binary representation of x
- `cos(x)`	Returns the cosine of x (x is in radians)
- `cosh(x)`	Returns the hyperbolic cosine of x
- `exp(x)`	Returns the value of Ex
- `expm1(x)`	Returns the value of Ex minus 1
- `floor(x)`	Returns x, rounded downwards to the nearest integer
- `fround(x)`	Returns the nearest (32-bit single precision) float representation of a number
- `log(x)`	Returns the natural logarithmof x
- `log10(x)`	Returns the base-10 logarithm of x
- `log1p(x)`	Returns the natural logarithm of 1 + x
- `log2(x)`	Returns the base-2 logarithm of x
- `max(x, y, z, ..., n)`	Returns the number with the highest value
- `min(x, y, z, ..., n)`	Returns the number with the lowest value
- `pow(x, y)`	Returns the value of x to the power of y
- `random()`	Returns a random number between 0 and 1
- `round(x)`	Rounds x to the nearest integer
- `sign(x)`	Returns the sign of a number (checks whether it is positive, negative or zero)
- `sin(x)`	Returns the sine of x (x is in radians)
- `sinh(x)`	Returns the hyperbolic sine of x
- `sqrt(x)`	Returns the square root of x
- `tan(x)`	Returns the tangent of an angle
- `tanh(x)`	Returns the hyperbolic tangent of a number
- `trunc(x)`	Returns the integer part of a number (x)

#### Regex Methods

- `compile()`	Deprecated in version 1.5. Compiles a regular expression
- `exec()`	Tests for a match in a string. Returns the first match
- `test()`	Tests for a match in a string. Returns true or false
- `toString()`	Returns the string value of the regular expression
- (string.)`match()`
- (string.)`matchAll()`
