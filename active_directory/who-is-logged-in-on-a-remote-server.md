# Who is logged in on a remote server?

We once suffered a terrible problem where windows user admin account passwords were reset every day, and as such, if you'd left yourself logged in on a remote server, your account would become locked out, requiring a phone call to unlock.

Trying to work out who, if anyone, was logged in on a remote server seemed quite tricky. Now I know better -- use the `quser.exe` tool, or the `query.exe` tool.


## Quser.exe

With `quser.exe` seeing who is logged onto a server is as simple as --

From one server, `SERVER-A`, ask who is logged in on `SERVER-B`

	quser.exe /server:SERVER-B

e.g.

 USERNAME              SESSIONNAME        ID  STATE   IDLE TIME  LOGON TIME
 lbambrick                                 2  Disc           28  3/02/2023 7:36 PM


[Info about QUser.exe](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/quser)



## With `Query.exe`

Similarly -- you can run "query user /server:SERVER-B"

Query has these possibilities:

	QUERY { PROCESS | SESSION | TERMSERVER | USER }

Where Query user has these:

	query user /?

	Display information about users logged on to the system.

	QUERY USER [username | sessionname | sessionid] [/SERVER:servername]

	  username            Identifies the username.
	  sessionname         Identifies the session named sessionname.
	  sessionid           Identifies the session with ID sessionid.
	  /SERVER:servername  The server to be queried (default is current).


## See also

- [How to get info from active directory](get-info-from-activedirectory.md)
- [Avoid 'access is denied' when using Powershell Remoting to Copy to a Shared Network Folder (i.e. Defeating Kerberos)](../powershell/avoid_access_is_denied_when_remoting_talking_to_share.md)
- [Want to prompt user for credentials and then run a script on a remote machine?](../powershell/interactive_remote_script.md)
- [Resolve 502 error (proxy issue) when using Powershell Remoting](../powershell/resolve_502_proxy_issue_when_remoting.md)