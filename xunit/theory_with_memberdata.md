# Xunit Theory with Member Data

Broadly speaking, in the Xunit test framework for .net, there are two kinds of tests: facts and theories, and they are distinguished by attributes.

A `fact` is a unit test with no parameters. A `theory` is a parameterized unit tests and there are -- broadly speaking -- three kind of theories.

A theory can have its parameter values supplied via: `InlineData` or `ClassData` or `MemberData`

For example:

	[Theory]
	[InlineData("spaghetti")]
	[InlineData("tagliatelli")]
	public void Can_Recognise_Pasta(string pastaName)
	{
		// Arrange
		var pastaRecognizer = new PastaRecognizer();
		
		// Act
		var result = pastaRecognizer.TryRecognize(pastaName);
		
		// Assert
		Assert.True(result, $"I recognise that {pastaName} is pasta.");
	}

...takes `InlineData` from multiple attributes and runs the test once for each attribute.

Instead of having hard-coded inline data right there -- which quickly becomes unwieldy -- you can use the `MemberData` attribute to specify a method that generates values. The above could be refactored to:

	[Theory]
	[MemberData(nameof(PastaTestGenerator.GetPasta), MemberType = typeof(PastaTestGenerator))]
	public void Can_Recognise_Pasta(string pastaName)
	{
		// Arrange
		var pastaRecognizer = new PastaRecognizer();
		
		// Act
		var result = pastaRecognizer.TryRecognize(pastaName);
		
		// Assert
		Assert.True(result, $"I recognise that {pastaName} is pasta.");
	}

	public static class PastaTestGenerator
	{
		public static IEnumerable<object[]> GetPasta()
		{
			return new List<object[]>  { 
				new object[] { "spaghetti" }, 
				new object[] { "tagliatelli" } };
		}
	}

Or -- just for fun -- we might make our test generator use `yield return`, instead.

	public static IEnumerable<object[]> GetPasta()
	{
		yield return new object[] { "spaghetti" };
		yield return new object[] { "tagliatelli" };
	}

The item being yielded is an `object[]` -- and its members and their types should match (or be assignable to) the parameters of the theory method.

In this case, the theory method has 1 parameter, `string pastaName` -- so we are returning just 1 item in that object array, and that item is of type string.

But it's not very nice -- all these `object[]` -- we'd rather specify our types exactly, or we can have invalid tests.

## ClassData with valid types

To have strong types, we can use the `Xunit.TheoryData` class -- like so.

We specify the type of our class data, and it is a type that derives from TheoryData<A,B,C..> -- where A,B,C... are the types of the methods parameters. In the case below, the methods parameters are just `string pastName` -- so the type are just `string`.

	[Theory]
	[ClassData(typeof(PastaTestGenerator))]
	public void Can_Recognise_Pasta_with_ClassData(string pastaName)
	{
		// Arrange
		var pastaRecognizer = new PastaRecognizer();

		// Act
		var result = pastaRecognizer.TryRecognize(pastaName);

		// Assert
		Assert.True(result, $"I recognise that {pastaName} is pasta.");
	}

The `PastaTestGenerator` would have to derive from `TheoryData<string>` -- and be written like so:

    public class PastaTestGenerator : TheoryData<string>
    {
        public PastaTestGenerator()
        {
            Add("spaghetti");
            Add("tagliatelli");
        }
    }

With that, we get the type guarantees we wanted, while using a `classData` attribute.

## MemberData with valid types

Alternatively, we can use the `memberData` and the `TheoryData` together like so:

We create a method that yields the  type of theory data we need, for example, this static method:

	public static class MyTestGenerator
	{
		public static TheoryData<string> PastaTypes()
		=> new TheoryData<string> {
			{ "Spaghetti" },
			{ "Tagliatelli" }
		};
	}

And we reference it from our `MemberData` attribute like so:

	[Theory]
	[MemberData(nameof(MyTestGenerator.PastaTypes), MemberType = typeof(MyTestGenerator))]
	public void Can_Recognise_Pasta_Via_MemberData(string pastaName)
	{
		// Arrange
		var pastaRecognizer = new PastaRecognizer();

		// Act
		var result = pastaRecognizer.TryRecognize(pastaName);

		// Assert
		Assert.True(result, $"I recognise that {pastaName} is pasta.");
	}

Incidentally -- in case you do need to recognise pasta types, here is the pasta recogniser I wrote which passes all of the tests above:

	public class PastaRecognizer
	{
		public bool TryRecognize(string pastaName) => true;
	}

...possible we need to add some *negative* test cases as well.

## Sources

- [Creating strongly typed xUnit theory test data with TheoryData](https://andrewlock.net/creating-strongly-typed-xunit-theory-test-data-with-theorydata/)

## See also

- [Getting Started with Cypress](../cypress/getting_started.md)