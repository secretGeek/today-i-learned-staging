# Resolve 502 error (proxy issue) when using Powershell Remoting

You try to use powershell remoting to connect to a machine.
	- You've done everything right.
	- You've got the right credentials and permissions
	- The remote WS-Management service is enabled on the machine
	- Firewalls are not stopping you...
	- You have a fresh hot cup of coffee ready.

You receive this message:

>	New-PSSession : [YourServer] Connecting to remote server failed with the following error message :<br />
>	The WinRM client received an HTTP status code of 502 from the remote WS-Management service.<br />
>	For more information, see the about_Remote_Troubleshooting Help topic.


502 means `502 Bad Gateway` -- and I tend to think "Hmmmm, proxy?" 🤔💭

Here's the code that failed...

	$Credentials = Get-Credential -Message "Provide the credentials for remote access" # prompts for credentials
	$TargetServer = "YourServer.YourDomain"
	$RemoteSession = New-PSSession -ComputerName $TargetServer -Credential $Credentials

	Invoke-Command -Session $RemoteSession {

		# We never get this far
		dir;

	}


What we will do is specify "No Proxy". To do that we need to create a `PSSessionOption` and add that to the call to `New-PSSession`, like so


	$Credentials = Get-Credential -Message "Provide the credentials for remote access" # prompts for credentials
	$TargetServer = "YourServer.YourDomain"
	$PSSessionOption = New-PSSessionOption -ProxyAccessType NoProxyServer
	$RemoteSession = New-PSSession -ComputerName $TargetServer -Credential $Credentials -SessionOption $PSSessionOption

	Invoke-Command -Session $RemoteSession {
		# Now it works...
		dir;
	}


i.e.


	$PSSessionOption = New-PSSessionOption -ProxyAccessType NoProxyServer


And don't forget to append it to the `New-PSSession` call:


	-SessionOption $PSSessionOption


## See also

- [Avoid 'access is denied' when using Powershell Remoting to Copy to a Shared Network Folder (i.e. Defeating Kerberos)](avoid_access_is_denied_when_remoting_talking_to_share.md)
- [Want to prompt user for credentials and then run a script on a remote machine?](interactive_remote_script.md)