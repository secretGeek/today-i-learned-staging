## How to avoid Xunit warnings around 'Do not use Assert to check for collection size'

All of these produces "warnings" in C#

	Assert.Equal(1, actual.Count()); // Warning: Do not use Assert.Equal() to check for collection size
	Assert.Equal(0, actual.Count()); // Warning: Do not use Assert.Equal() to check for collection size
	Assert.NotEqual(0, actual.Count());  // Warning: Do not use Assert.NotEqual() to check for collection size

## Alternatives

Instead of 

	Assert.Equal(1, actual.Count()); // Warning: Do not use Assert.Equal() to check for collection size

use:

	Assert.Single(actual); // No warning 

Instead of 

	Assert.Equal(0, actual.Count()); // Warning: Do not use Assert.Equal() to check for collection size

use:

	Assert.Empty(actual); // No warning

Instead of 

	Assert.NotEqual(0, actual.Count());  // Warning: Do not use Assert.NotEqual() to check for collection size

use:

	Assert.Any(actual); // No warning


## When is Assert.Equal acceptable for checking collection size? 

For values other than 0, 1, and "not 0", it is fine to use Assert.Equal, e.g.

	Assert.Equal(2, actual.Count()); // No warning generated for values other than 0 and 1

## Source

- [What's the idiomatic way to verify collection size in xUnit?](https://stackoverflow.com/a/68299967) - accepted answer here
