# Config from an external source

Say you want your `connectionStrings` to be pulled in from an external file, you can do that like this:

	<connectionStrings configSource="ConnectionStringsProduction.xml" />

That way, for example, your `web.config`, your `application.config` (for some other apps) and your `linqpad.config` can all use the exact same file for connectionStrings (even though the rest of their config is very unique).

Or if you have 3 different web applications that all want the same config for just part of their config file, you can use this trick.

## Or dynamically/manually load connection string info yourself

More extreme is this method:

(*I used this for analyzing a lot of connection strings in different projects*)

Make your *own* connection string object:

	public class ConnectionInfo
	{
		public string ConnectionString { get; set; }
		public string Name { get; set; }
		public string Provider { get; set; }
	}

And use this method to load a connection string file, all by itself.

	private IEnumerable<ConnectionInfo> LoadConfig(string fileName)
	{
		using (var reader = XmlReader.Create(fileName))
		{
			reader.MoveToContent();
			var connectionStrings = new List<ConnectionInfo>();
			while (reader.ReadToFollowing("add"))
			{
				reader.MoveToFirstAttribute();
				var c = new ConnectionInfo();

				if (reader.MoveToAttribute("name")) c.Name = reader.Value;
				if (reader.MoveToAttribute("connectionString")) c.ConnectionString = reader.Value;
				if (reader.MoveToAttribute("providerName")) c.Provider = reader.Value;
				connectionStrings.Add(c);
			}

		return connectionStrings;
		}
	}

Like so

	LoadConfig(@"C:\Temp\SomeConnectionStrings.config");

## See also

- [git config](../git/git_config.md)
- [How to best configure and use `mstsc.exe` - microsoft terminal services client](../mstsc/how_to_best_configure_and_use_mstsc.md)
