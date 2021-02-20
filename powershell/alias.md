# Alias: a guide to powershell and aliases

## To Set An Alias:

	set-alias -name gito -value git_off

## To check an alias:

	get-command *cls*

...produces a list of not just aliases but commands that match your pattern. (so i sometimes prefer it over `get-alias` though it can produce unwanted results.)

```plaintext
CommandType     Name
===========     ====
Alias           cls -> Clear-Host
```

## To find aliases for a command

Wonder what aliases exist for a command (or commands)? add the `-def` parameter to `get-alias`

	get-alias -def "push-location"

## Aliases *can't* have parameters: make little functions instead

in bash, an alias can include parameters. Not so in PowerShell. It's just an abbreviation.

set-alias tf "tree /f" # this doesn't work! (bash allows that kind of thing)

To create an alias with parameters you're advised to create a tiny function in your `$PROFILE`.

e.g.

	function tf() {
		tree /f
	}

...and over time: grow it into a cmdLet and eventually put it into a module.