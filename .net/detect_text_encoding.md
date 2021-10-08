# Detect the encoding of a file

Well this is a doozy, and bound to require constant upkeep.

I always start off reading files like this...

	using (var sr = new StreamReader(fileName))

Then, someone complains that their non-ascii files weren't read correctly, I ask for example files, perform some tests and end up with this:

	using (var sr = new StreamReader(fileName, System.Text.Encoding.UTF8))

It works for a while, then I receive more complaints and more test files. I see that it doesn't work for the new test files. Hmm.

I studiously avoid thinking about ["The Absolute Minimum Every Software Developer Absolutely, Positively Must Know About Unicode and Character Sets (No Excuses!)"](https://www.joelonsoftware.com/2003/10/08/the-absolute-minimum-every-software-developer-absolutely-positively-must-know-about-unicode-and-character-sets-no-excuses/).

I can open the file in NotePad++ and see under the conveniently named "Encoding" menu, exactly which encoding NotePad++ decides on for a given file.

I've learned that some files have byte order marks that give pretty important clues about the encoding.

Here's my re-creation fo the table from [Wikipedia: Byte order marks by encoding](https://en.wikipedia.org/wiki/Byte_order_mark#Byte_order_marks_by_encoding)

| Encoding | Representation (hexadecimal) | Representation (decimal) | Might look like... |
|----|----|----|----|
| `UTF-8` | `EF BB BF` | `239 187 191` | `ï»¿` |
| `UTF-16 (BE)` | `FE FF` | `254 255` | `þÿ` |
| `UTF-16 (LE)` | `FF FE` | `255 254` | `ÿþ`
| `UTF-32 (BE)` | `00 00 FE FF` | `0 0 254 255` | `NULNULþÿ` (where `NUL` means the `NULL` character) |
| `UTF-32 (LE)` | `FF FE 00 00` | `255 254 0 0` | `ÿþNULNUL` |
| `UTF-7` | `2B 2F 76` | `43 47 118` | `+/v` |
| `UTF-1` | `F7 64 4C` | `247 100 76` | `÷dL` |
| `UTF-EBCDIC` | `DD 73 66 73` | `221 115 102 115` | `Ýsfs` |
| `SCSU` | `0E FE FF[c]` | `14 254 255` | `^Nþÿ` (where `^N` is the shift out character) |
| `BOCU-1` | `FB EE 28` | `251 238 40` | `ûî(` |
| `GB-18030` | `84 31 95 33` | `132 49 149 51` | `„1•3` |

Wikipedia points out that for `UTF-8`, `UTF-7`, `UTF-1`, `UTF-EBCDIC`, `SCSU`, `BOCU-1`, `GB-18030` these starting bytes of the file are not literally a "byte order mark" as these encoding don't take multiple bytes to encode a characters, hence no byte order is needed. instead in those cases these bytes act as an indicator of the encoding.

(But this doesn't help if no byte order mark is present.)

From stack overflow I've found an answer, with a lot of upvotes, which almost works for me. It relies on the presence of a `BOM` as listed above, and failing that returns `default`.

Only change I had to make is highlighted below:

	/// <summary>
	/// Determines a text file's encoding by analyzing its byte order mark (BOM).
	/// Defaults to ASCII when detection of the text file's endian-ness fails.
	/// </summary>
	/// <param name="filename">The text file to analyze.</param>
	/// <returns>The detected encoding.</returns>
	private static Encoding GetEncoding(string filename)
	{
		// Read the BOM
		var bom = new byte[4];
		using (var file = new FileStream(filename, FileMode.Open, FileAccess.Read))
		{
			file.Read(bom, 0, 4);
		}

		// Analyze the BOM
		if (bom[0] == 0x2b && bom[1] == 0x2f && bom[2] == 0x76) return Encoding.UTF7;
		if (bom[0] == 0xef && bom[1] == 0xbb && bom[2] == 0xbf) return Encoding.UTF8;
		if (bom[0] == 0xff && bom[1] == 0xfe) return Encoding.Unicode; // UTF-16LE
		if (bom[0] == 0xfe && bom[1] == 0xff) return Encoding.BigEndianUnicode; // UTF-16BE
		if (bom[0] == 0 && bom[1] == 0 && bom[2] == 0xfe && bom[3] == 0xff) return Encoding.UTF32;
		return Encoding.Default; // **Changed this line**
	}

And use it thus:

	var encoding = GetEncoding(fileName);
	using (var sr = new StreamReader(fileName, encoding)) // System.Text.Encoding.UTF8))

I am certain this will require further changes in future.

## Bonus West Wind Version

Note that Rick Strahl has blogged a version of this here: [Detecting Text Encoding for StreamReader](https://weblog.west-wind.com/posts/2007/Nov/28/Detecting-Text-Encoding-for-StreamReader)

His work is always *battle tested*.

## Source

- [Wikipedia: Byte order marks by encoding](https://en.wikipedia.org/wiki/Byte_order_mark#Byte_order_marks_by_encoding)
- [Stack Overflow: Effective way to find any file's Encoding](http://stackoverflow.com/questions/3825390/effective-way-to-find-any-files-encoding)
- ["The Absolute Minimum Every Software Developer Absolutely, Positively Must Know About Unicode and Character Sets (No Excuses!)"](https://www.joelonsoftware.com/2003/10/08/the-absolute-minimum-every-software-developer-absolutely-positively-must-know-about-unicode-and-character-sets-no-excuses/)
- [A Programmer's Introduction to Unicode](http://reedbeta.com/blog/programmers-intro-to-unicode/)
- [A Practical Guide to Character Sets and Encodings](https://medium.com/@keithgabryelski/a-practical-guide-to-character-sets-and-encodings-b5362447456f#.dn0guodnz)
- [West Wind: Detecting Text Encoding for StreamReader](https://weblog.west-wind.com/posts/2007/Nov/28/Detecting-Text-Encoding-for-StreamReader)

## See also

- [Detect File Encoding (with Powershell)](../powershell/detect_file_encoding.md)
- [All Emoji returned by Emoji Module](../powershell/emoji_list.md)
