# Windows Path Environment variable -- view/edit in Windows

- From cmd.exe, type `SET` and you'll see the value of all environment variables, including `PATH`
- From cmd.exe, type `%PATH%` and you'll see the value of `PATH`
- From Powershell, `Set-Location Env:`, to visit the `ps-drive` containing all environment variables, and `dir path` to see the path variable.
- From Powershell, `$Env:Path`
- From Powershell, to list each directory in the path:

      $env:path | % { $_ -split ";" }

- From **Windows**, method 1
  - Press `[Windows][Break]` -- this brings up `Control Panel\All Control Panel Items\System`
			- then [Find environment variables in System Properties](#find-environment-variables-in-system-properties)
- From Windows, method 2
ex
  - `[Windows][R]` to bring up the run dialog and type `sysdm.cpl`
			- then [Find environment variables in System Properties](#find-environment-variables-in-system-properties)
- From Windows, method 3

  - `[Windows][R]` to bring up the run dialog and type `rundll32 sysdm.cpl,EditEnvironmentVariables`
    - You are already in the [environment variables dialog](#environment-variables-dialog)!

## Find environment variables in System Properties

- Click "Advanced System settings" (you'll need to enter Admin password or elevate) and you'll get to "System Properties"
  - Advanced tab: click "Environment Variables..."
    - There you have "user variables for current user" and "System variables"
    - Note that those in the "user variables" section also exist in the System variables -- so think carefully about which one you mean.

## Set a Persistent Environment variable from Powershell

	[System.Environment]::SetEnvironmentVariable('NAME_OF_VARIABLE', 'value goes here', [System.EnvironmentVariableTarget]::User)

## Environment Variables Dialog

## See also

- [PATH: getting it, adding to it and managing it (from powershell)](../powershell/PATH.md)
