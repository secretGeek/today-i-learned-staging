# What is a module?

> In its simplest form a module is a subfolder in one of the folders listed in `$env:PSModulePath` with a PowerShell script of the same name (but with the extension `.psm1` instead of `.ps1`)
>
>&mdash;[source](https://stackoverflow.com/questions/27713844/dot-source-a-script-within-a-function)

You can see each of the folders listed in `$env:PSModulePath` by splitting it like this:

	$env:PSModulePath | % {$_ -split ";"}

e.g. (I'll explain them all here)

	C:\Users\MyUser\OneDrive\Documents\WindowsPowerShell\Modules		# Modules for *just me*
	C:\Program Files\WindowsPowerShell\Modules											# Modules for all users
	C:\Windows\system32\WindowsPowerShell\v1.0\Modules							# Modules that windows installed...


The `.psm1` file ends with an `Export-ModuleMember` statement saying which functions and aliases to export., e.g.

	Export-ModuleMember -Function Get-Foo, New-Bar, ... -Alias gf, ..


## How to import a local .psm1 module file

If you have a module as a local `.psm1` file, you can import it like this:

	import-module cowsay.psm1

That will create a folder called `cowsay` (in this case), under one of the `$env:PSModulePath` folders mentioned above, and put the `cowsay.psm1` file into it.

Normally you would instead import it from an online repository. And you may also want to know how to publish to one of those.







## Sources

* [Stackoverflow: How to put those extra functions into a module.](https://stackoverflow.com/questions/27713844/dot-source-a-script-within-a-function)
* [How to install PowerShell modules](https://activedirectorypro.com/install-powershell-modules/)

## See also

* [How to publish a module](publish_module.md)