# How to "Dump()" a dynamic object in Linqpad

Trying to .Dump() an expando or other dynamic object in Linqpad?

It will fail at runtime with this error:

	RunTimeBinderException: 'System.Dynamic.ExpandoObject' does not contain a definition for 'Dump'

The workaround is simple -- cast it to `object`!

	//This Fails with: 'string' does not contain a definition for 'Dump'
	dynamic d = "hello";
	//d.Dump();

	//But This works!
	((object)d).Dump();

	// as does this)
	(d as Object).Dump();

## see also

- [Csharp version 4 adds the "Dynamic" feature](../csharp/version4.md#dynamic-binding)
- [Convert object to dynamic](../csharp/object_to_dynamic.md)