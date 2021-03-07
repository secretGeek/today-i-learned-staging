# Convert object to dynamic

When you want an object that is not [dynamic](version4.md#dynamic-binding) to take on dynamic capabilities, this extension method is your friend:

	//Using System.Dynamic and System.ComponentModel
	public static class Extensions
	{
		public static dynamic ToDynamic(this object value)
		{
			if (value.IsListOrArray())
			{

				var list = new List<ExpandoObject>();
				IEnumerable enumerable = value as IEnumerable;
				foreach (object o in enumerable)
				{
					list.Add(o.ToDynamic());
				}

				return (dynamic)list;
			}

			IDictionary<string, object> expando = new ExpandoObject();

			foreach (PropertyDescriptor property in TypeDescriptor.GetProperties(value.GetType()))
			{
				expando.Add(property.Name, property.GetValue(value));
			}

			return (dynamic)expando;
		}

		public static bool IsListOrArray(this object value)
		{
			if (value is IList && value.GetType().IsGenericType)
			{
				return true;
			}

			var valueType = value.GetType();
			if (valueType.IsArray)
			{
				return true;
			}

			return false;
		}
	}

## Source

- From [asmodeus74's gist ](https://gist.github.com/asmodeus74/0f4cbc23b7a168f16c84) ... which is from a now 404'ing blog post <http://blog.jorgef.net/2011/06/converting-any-object-to-dynamic.html> by [Jorge Fioranelli](http://jorgef.net/)

## See also

- [Csharp version 4 adds the "Dynamic" feature](version4.md#dynamic-binding)
- [Linqpad Dump Dynamic](../linqpad/dump_dynamic.md)