# Environment variables -- view/edit them on windows


- From cmd.exe, type `SET` and you'll see the value of all environment variables
- From Powershell, `Set-Location Env:`
- From **Windows**, method 1
    - Press `[Windows`]`[Break`] -- this brings up `Control Panel\All Control Panel Items\System`
			- then [Find environment variables in System Properties](#find-environment-variables-in-system-properties)
- From Windows, method 2
ex
    - `[Windows`]`[R`] to bring up the run dialog and type `sysdm.cpl`
			- then [Find environment variables in System Properties](#find-environment-variables-in-system-properties)
- From Windows, method 3

    - `[Windows`]`[R`] to bring up the run dialog and type `rundll32 sysdm.cpl,EditEnvironmentVariables`
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
