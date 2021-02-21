# Command Precedence in Powershell

PowerShell uses the following precedence rules when it runs commands for all items loaded in the current session:

Powershell decides what to run based on this order of precedence:

- `Alias`
- `Function`
- `Cmdlet`
- External executables, on Windows in this order:
	- `.com`
	- `.exe`
	- `.bat`
	- `.cmd`

If you type 'doit' at a prompt in powershell, it will look for:

- An `alias` called `doit`
- A function, `doit`
- A cmdLet called `doit`
- An exectuable on the PATH called `doit.com`
- An exectuable on the PATH called `doit.exe`
- An batch file on the PATH called `doit.bat`
- An batch file on the PATH called `doit.cmd`

...and it will run the first one it finds.

## See also

- [Alias: a guide to powershell and aliases](alias.md)
- [PATH: getting it, adding to it and managing it](PATH.md)
- [Environment variables -- view/edit them on windows](../windows/environment_variables.md)