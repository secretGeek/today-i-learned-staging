# For a new process to runas a different (admin) user from powershell

Run a new console window as admin, like so:

	Start-Process console.exe -Verb runAs

Or you might prefer

	Start-Process powershell -Verb runAs

Or better yet...

	Start-Process "$env:ChocolateyInstall\lib\ConsoleZ\tools\console.exe" -Verb runAs

e.g.

	Start-Process C:\Users\Leon\Downloads\cmder_mini\vendor\conemu-maximus5\ConEmu64.exe -Verb runAs

Or simply:

	Start-Process ConEmu64.exe -Verb runAs


To specify a different user:

	Start-Process SSMS.exe -Verb runAs -Credential "My_Domai\testuser"

Using the `runas` command:

	runas /user:"antony jr" notepad.exe


![run... run as administrator](Run_Runas_Administrator.jpg)