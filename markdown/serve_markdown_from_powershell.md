# Serve markdown as html, in a browser, from powershell


Above is a `h1` heading, and this is a code block:

	# Hello World

	This is a test.

The command used to **serve** this file is:

	.\serve-md.ps1 -FilePath .\serve_markdown_from_powershell.md -Port 8086

The powershell script is here: [serve-md.ps1](serve-md.ps1)

It relies on `Microsoft.PowerShell.Utility` to perform the markdown to html conversion.

