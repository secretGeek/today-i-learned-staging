# Zip a single file

This is a minimal C# function (usable from [Linqpad](../linqpad/01_summary.md)) to Zip a single file into its own archive.

References these libraries:

- `System.IO.Compression.dll`
- `System.IO.Compression.FileSystem.dll`

Code:

	using System.IO.Compression;

	public void Zipit(string zipPath, string sourceFilePath)
	{
		var file = Path.GetFileName(sourceFilePath);
		using (ZipArchive archive = ZipFile.Open(zipPath, ZipArchiveMode.Create))
			archive.CreateEntryFromFile(sourceFilePath, file);
	}
