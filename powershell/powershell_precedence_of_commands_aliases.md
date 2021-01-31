# Command Precedence in Powershell

PowerShell uses the following precedence order when it runs commands for all items loaded in the current session:

Powershell decides what to run based on this precedence:

- `Alias`
- `Function`
- `Cmdlet`
- external executables, on windows ordered like:
  - `.com`
  - `.exe`
  - `.bat`
  - `.cmd`

If you type 'doit' at a prompt in powershell, it will look for:

- An `alias` called `go`
- A function, `go`
- A cmdLet called `go`
- An exectuable on the path called `go.com`
- An exectuable on the path called `go.exe`
- An batch file on the path called `go.bat`
- An batch file on the path called `go.cmd`

...and it will run the first one it finds.