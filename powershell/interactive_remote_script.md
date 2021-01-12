# Want to prompt user for credentials and then run a script on a remote machine?

Assuming the Remote Computer Name is stored in a variable `$remoteComputerName`

	$credentials = Get-Credential -Message "Provide the credentials for remote access" -UserName $env:username 
	$TargetServer = "YourServer"
	$remoteSession = New-PSSession -ComputerName $TargetServer = "YourServer" -Credential $credentials

	Invoke-Command -ComputerName $remoteComputerName -ScriptBlock { 
	# Commands in here are remote executed, hence relative to $remoteComputerName
	# Note that if referring to a variable from outside this block, preface it with 'using'
	# e.g. '$using:TargetServer' has a value of 'YourServer'
	#    ...whereas '$TargetServer' without the `using:` is blank, as its an unused variable local to this block.
	} -credential $name

	
Furthermore, note that if you embed a `$using:` in a double-quoted string (`" "`), they need to be embedded in a `$( )`, like this:

	"$($using:TargetServer)"

...and your chances of forgetting some nuance of remoting is always 100%.


# See also

- [Avoid 'access is denied' when using Powershell Remoting to Copy to a Shared Network Folder (i.e. Defeating Kerberos)](avoid_access_is_denied_when_remoting_talking_to_share.md)
- [Resolve 502 error (proxy issue) when using Powershell Remoting](resolve_502_proxy_issue_when_remoting.md)
