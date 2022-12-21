# How to get info from active directory

## Look for a user or group

This works on most windows machines (if they are connected to a domain):

    Rundll32 dsquery.dll OpenQueryWindow

...brings up a tool that lets you search for users or groups. It does not tell you very much about the user or group, but you can see which users and groups are in a group.

## Find out information about yourself

The Group Policy Result tool tells you interesting things, even if you're not connected to a domain.

	gpresult /v

...including which groups you are a member of.

## Find your logon server

In powershell:

	echo $env:LOGONSERVER

(or in `cmd.exe` use `echo %LOGONSERVER%`)

## Use Sysinternals tools

[ADExplorer from sysinternals](https://docs.microsoft.com/en-gb/sysinternals/downloads/adexplorer) is a comprehensive tool for exploring the Active Directory environment.

You can use all of their tools without manually downloading them by using:

	net use * \\live.sysinternals.com\tools\

...to create a local drive (e.g. `z:` from which you can access all their tools.

## Remote Server Administration Tools

If possible though, I prefer to use `RSAT` (a name it is best not to say out loud) which includes 147 powerful powershell `Cmdlet`s in an `ActiveDirectory` module. I mostly use [`Get-ADUser`](../powershell/get_aduser.md) and [`Get-ADGoup`](get-adgroup.md).

## See also

- [Get-AdGroup in powershell via RSAT (Remote server administration tools)](get-adgroup.md)
- [Powershell: get-aduser is useful to get info about a user account](../powershell/get_aduser.md)
- [How to determine password complexity rules (from powershell)](../powershell/password_complexity.md) &mdash; uses Get-ADDefaultDomainPasswordPolicy
