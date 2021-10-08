# Using Anki for Windows

- install it.

## Import CSV files to anki

Here's the format (it's quite flexible)

Basic example:

	Front of card,Back of card

(Qualify with double quotes if needed for commas or new lines. If you need double-quotes, then double them.)

Alternatively, for new lines you can use `<br>` - but be sure to choose "allow HTML in fields".

More advanced...

	# Comments on any line
	tags:tag1 tag2 tag3
	# ^^ those tags will be added to all these cards...
	Front of card 1,Back of card 1
	Front of card 2,Back of card 2
	Front of card 3,Back of card 3
	Front of card 4,Back of card 4

You can also configure the import screen to have more fields -- it's quite versatile.

---------------------------
Anki
---------------------------
Failed to create OpenGL context for format QSurfaceFormat(version 2.0, options QFlags<QSurfaceFormat::FormatOption>(), depthBufferSize 24, redBufferSize -1, greenBufferSize -1, blueBufferSize -1, alphaBufferSize -1, stencilBufferSize 8, samples 0, swapBehavior QSurfaceFormat::DefaultSwapBehavior, swapInterval 1, colorSpace QSurfaceFormat::DefaultColorSpace, profile  QSurfaceFormat::NoProfile) .
This is most likely caused by not having the necessary graphics drivers installed.

Install a driver providing OpenGL 2.0 or higher, or, if this is not possible, make sure the ANGLE Open GL ES 2.0 emulation libraries (libEGL.dll, libGLESv2.dll and d3dcompiler_*.dll) are available in the application executable's directory or in a location listed in PATH.
---------------------------
OK
---------------------------

...um .... ok....

So I did this... ([based on...](https://changes.ankiweb.net/known-issues.html))

	cmd

	echo auto > %APPDATA%\Anki2\gldriver

	exit

i.e. create a file called `$env:appdata\Anki2\gldriver` (no file extension)

...and put the word "auto" in it.
