# Powershell experiments with Alias


## See if there's any alias for a commands

Often you know the alias and not the command.

e.g.

	get-alias "dir"

... teaches you that `dir` is an alias for `get-childitem`

Sometimes the opposite is true.

e.g. I wasn't sure what alias to use instead of the cumbersome `push-location`

	get-alias -definition "push-location"

or, shorter:

	get-alias -def "push-location"

shortest:

	gal -def push-loc*

...aha! `pushd`

Btw, Here's what my first, most cumbersome attempt looked like:

	alias | % { if($_.definition -eq "push-location") {$_} }

This could be better written as:

	alias  | ? Definition -like 'push-location'


In bash you'd use something like

	alias | grep push-location

The nearest equivalent of this is:

	alias  | select-string 'push-location'

And it doesn't work. (Because the select-string works by performing a .toString on the object it receives, and to-string of this object only returns the name, not the definition.)