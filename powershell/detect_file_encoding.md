# Detect File Encoding (with Powershell)

As described in [.net: Detect the encoding of a file](../.net/detect_text_encoding.md) this is a real *doozy*.

I have two powershell functions for this, neither of them perfect in every situation.

And I have a function for outputing and/or highlighting "unexpected" characters in a text file.

And one for (attempting) to convert the encoding.

## External references

- [Gist: jpoehls encoding-helpers.ps1](https://gist.githubusercontent.com/jpoehls/2406504/raw/c49d74029ec0af89f3a68a6f1e659bfca6322490/encoding-helpers.ps1)
- [Frank Richard: Powershell get encoding file type](http://franckrichard.blogspot.com/2010/08/powershell-get-encoding-file-type.html)
	- a port of Rick Strahl's [Detecting Text Encoding for StreamReader](http://www.west-wind.com/Weblog/posts/197245.aspx)

## See also

- [.net: Detect the encoding of a file](../.net/detect_text_encoding.md)
- [Powershell 'out-file' set the encoding](out-file-encoding.md)