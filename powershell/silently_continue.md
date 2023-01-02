# ErrorAction SilentlyContinue

Sometimes you run a command to "check" something -- and it throws an error that is completely *unwanted*.

e.g. you type `dir abc` ... you don't expect an error!

    > dir abc
    dir : Cannot find path 'C:\temp\abc' because it does not exist.
    At line:1 char:1
    + dir abc
    + ~~~~~~~
        + CategoryInfo          : ObjectNotFound: (C:\temp\abc:String) [Get-Child
    Item], ItemNotFoundException
        + FullyQualifiedErrorId : PathNotFound,Microsoft.PowerShell.Commands.GetChildItemCommand

Add the parameter: `-ErrorAction SilentlyContinue` to avoid this behaviour:

    dir abc -ErrorAction SilentlyContinue

## Using the $ErrorActionPreference variable =v "SilentlyContinue"

Instead of setting the behaviour on each command, you can set it for the entire session, but using the preference variable: `$ErrorActionPreference`

This defaults to having a value of `Continue` (meaning -- display an error but continue processing.)

You can set it to any value you want. e.g.

    $ErrorActionPreference = "SilentlyContinue"
    dir abc

(No output, since there was no such file, and no error, due to the `SilentlyContinue` preference)
