# VSCode Powershell Profile

VSCode's powershell terminal is exactly the same one you use in regular powershell.  It runs the `$PROFILE` the exact same way.

The easiest way for the profile to tell that it is being run by `vscode` is that `vscode` sets an environment variable called `TERM_PROGRAM`.

So I have a condition in my profile at which point I do some simple things and then exit the profile, instead of loading all my usual convenience functions.

	if ($null -ne $env:TERM_PROGRAM -and $env:TERM_PROGRAM -eq "VSCODE") {
		Write-host "VSCODE!" -f green;
		. (Join-Path $env:util "Powershell\vsprompt.ps1")
		return;
	}

...I detect it is vscode, output "VSCODE!" in green, load a custom `prompt` function and then `return` to exit the profile (instead of running the remaining 600 lines of gnarly profile code and ascii art I've built up over months of covid isolation.)