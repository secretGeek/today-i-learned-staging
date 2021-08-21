# Powershell 'out-file' set the encoding

	out-file $file -encoding utf8

...will create what Notepad++ interprets as `utf8 bom`

Full set of options...

- `unknown`
- `string`
- `unicode`
- `bigendianunicode`
- `utf8`
- `utf7`
- `utf32`
- `ascii`
- `default`
- `oem`

or...

	"Hello" | out-file "hello-world.txt" -encoding Unicode

What sort of files do we get?

I've run this script...

	"unknown" | out-file "out-file-unknown.txt" -encoding unknown
	"string" | out-file "out-file-string.txt" -encoding string
	"unicode" | out-file "out-file-unicode.txt" -encoding unicode
	"bigendianunicode" | out-file "out-file-bigendianunicode.txt" -encoding bigendianunicode
	"utf8" | out-file "out-file-utf8.txt" -encoding utf8
	"utf7" | out-file "out-file-utf7.txt" -encoding utf7
	"utf32" | out-file "out-file-utf32.txt" -encoding utf32
	"ascii" | out-file "out-file-ascii.txt" -encoding ascii
	"default" | out-file "out-file-default.txt" -encoding default
	"oem" | out-file "out-file-oem.txt" -encoding oem

And here's what notepad++ thinks of the files (note that there is significant interpretation happening for each of them... most this only tells you if a BOM is present, and if it's big or little endian)

| Powershell says | notepad++ interprets... |
|----|----|
| `ascii` | `UTF-8` |
| `bigendianunicode` | `UCS-2 BE BOM` |
| `default` | `UTF-8` |
| `oem` | `UTF-8` |
| `string` | `UCS-2 LE BOM` |
| `unicode` | `UCS-2 LE BOM` |
| `unknown` | `UCS-2 LE BOM` |
| `utf32` | `UCS-2 LE BOM` (but unreadable with extra nulls between chars)|
| `utf7` | `UTF-8` |
| `utf8` | `UTF-8-BOM` |

## See also

- [Detect File Encoding (with Powershell)](detect_file_encoding.md)
- [.net: Detect the encoding of a file](../.net/detect_text_encoding.md)
- [Base64 Encode and Decode string](base64_encode_decode.md)
