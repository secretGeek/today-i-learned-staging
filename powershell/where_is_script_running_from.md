# Where is the current script running from?

Subtitle: what is the location of the caller?

Scenario:

We have a script, `HelloWorld.ps1` located in `C:\Scripts\`

We run this script, from the location `C:\CurrentPath\` like so:

	C:\CurrentPath\> C:\Scripts\HelloWorld.ps1

We want the script to output:

>	The script is located in C:\Scripts
>
>	The script's full name and path is C:\Scripts\HelloWorld.ps1
>
>	You are running it from C:\CurrentPath

How do we do it?

In **PowerShell 3.0 and above** we write:

	write-host "The script is located in $PSScriptRoot"
	# e.g. C:\Scripts

	write-host "The script's full name and path is $PSCommandPath"
	# e.g. C:\Scripts\HelloWorld.ps1
	
	write-host "You are running it from $((Resolve-Path .\).Path)"
	# e.g. C:\CurrentPath

In older version we wrote:

	write-host "The script is located in $(Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)"
	# e.g. C:\Scripts

	write-host "The script's full name and path is $($MyInvocation.MyCommand.Path)"
	# e.g. C:\Scripts\HelloWorld.ps1

	write-host "You are running it from $((Resolve-Path .\).Path)"
	# e.g. C:\CurrentPath

## Caveat!

One caveat with these scripts... they are unlike most powershell scripts because
they only work properly when they are inside a script.

They don't behave the same if you just paste them into the commandline.

## Bonus questions

### Question: What if one script is invoked from another? How do you inspect/query that chain?

A caller, tx-14327, asks:

> What if one script is invoked from another?
>
> How do you inspect/query that chain?

Good question. I don't know the answer yet. Do you?

(I think the -Scope in this old code might've been put there for that reason...)

	$scriptpath = (split-path (Get-Variable MyInvocation -Scope Script).Value.MyCommand.Path)

## See also

- Scopes! (and not the monkey trial)