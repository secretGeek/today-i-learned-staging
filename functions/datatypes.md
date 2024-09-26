# Examples of Data Types in Different Systems

## Examples from c# (.Net)

(Via [Built-in types - C# References](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/built-in-types))

- "Value Types"
  - `bool`
  - `byte`
  - `sbyte`
  - `char`
  - `decimal`
  - `double`
  - `float`
  - `int`
  - `uint`
  - `nint`
  - `nuint`
  - `long`
  - `ulong`
  - `short`
  - `ushort`
- "Reference Types" (Built in)
  - `object`
  - `string` (including `@verbatim string literals` and `"""raw string literals"""`)
  - `dynamic`
  - `delegate` ([see](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/reference-types#the-delegate-type))
- "Reference types" (more!)
  - `record`
  - `class`
  - `interface`
  - `Nullable reference types`
- "void"
  - `void`  ([see](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/void))
- "Unmanaged types"
  - (all Value types) plus:
  - `enum`
  - `pointer`
  - `tuple`
  - any user-defined `struct` with only fileds of unmanaged types

## Example from SQL Server

(Via [Data types (Transact-SQL)](https://learn.microsoft.com/en-us/sql/t-sql/data-types/data-types-transact-sql))

- "Exact numerics"
  - `tinyint`
  - `smallint`
  - `int`
  - `bigint`
  - `bit` (i.e. `Boolean`)
  - `decimal` (aka `numeric`)
  - `money`
  - `smallmoney`
- "Approximate numerics"
  - `float`
  - `real`
- "Date and time"
  - `date`
  - `time`
  - `datetime2`
  - `datetimeoffset`
  - `datetime`
  - `smalldatetime`
- "Character strings"
  - `char`
  - `varchar`
  - `text`
- "Unicode character strings"
  - `nchar`
  - `nvarchar`
  - `ntext`
- "Binary strings"
  - `binary`
  - `varbinary`
  - `image`
- "Other data types"
  - `cursor`
  - `geography`
  - `geometry`
  - `hierarchyid`
  - `json`
  - `rowversion`
  - `sql_variant`
  - `table`
  - `uniqueidentifier`
  - `xml`

## Example from  SEQ

(Via [Data types](https://docs.datalust.co/docs/the-seq-query-language#data-types))

- `'single quoted'` - strings (which we've already seen); the quote character ' can be escaped by doubling: 'Can''t'
- `123`, `0.45`, `0xc0ffee` - numbers, internally represented as 128-bit decimal values
- `30d`, `100ms` - durations, specified as whole numbers of days, hours, minutes, seconds, or ms milliseconds
- `true` and `false` - Booleans
- `[1, 'test', true]` - arrays with `[0]` (zero-based) numeric indexing
- `{ace: 1, 'beta gamma': 23}` - object literals with string or identifier keys
- `null`

## Sources

- [Built-in types - C# References](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/built-in-types)
- [Data types (Transact-SQL)](https://learn.microsoft.com/en-us/sql/t-sql/data-types/data-types-transact-sql)
- [SEQ Query Language #Data types](https://docs.datalust.co/docs/the-seq-query-language#data-types)