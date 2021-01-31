# Avoid 'access is denied' when using Powershell Remoting to Copy to a Shared Network Folder (i.e. Defeating Kerberos)


**Scenario** You are using remoting, and have assigned credentials to the remoting session...

Within the remote session block you are trying to talk a network fileshare, but failing with Access Denied. (`UnauthorizedAccessException`)

For example:

	$Credentials = Get-Credential -Message "Provide the credentials for remote access" # prompts for credentials
	$TargetServer = "YourServer"
	$PSSessionOption = New-PSSessionOption -ProxyAccessType NoProxyServer
	$RemoteSession = New-PSSession -ComputerName $TargetServer -Credential $Credentials -SessionOption $PSSessionOption

	$TargetFolder = "\\OtherServer\ShareName\Pathy\Path"
	write-host "THIS WON'T WORK..." -f red
	Invoke-Command -Session $RemoteSession {

		# This works: we can view local folders on machine
		dir;

		# This doesn't work: we cannot authenticate to view restricted network shares
		dir $using:TargetFolder
	}




But it errors with "Access is Denied"

You can't believe it, because when you remote onto the same machine with Remote Desktop Connection Manager (etc) and run the same command in powershell, with the exact same user -- you *do* have permission!

What's going on?


It **kerberos** of course! It's always kerberos!

Those credentials are being quietly refused to be passed along to the second machine -- so it just don't matter.

Instead -- do this...

	$Credentials = Get-Credential -Message "Provide the credentials for remote access" # prompts for credentials
	$TargetServer = "YourServer"
	$PSSessionOption = New-PSSessionOption -ProxyAccessType NoProxyServer
	$RemoteSession = New-PSSession -ComputerName $TargetServer -Credential $Credentials -SessionOption $PSSessionOption

	$TargetFolder = "\\OtherServer\ShareName\Pathy\Path"


	write-host "HOW ABOUT THESE APPLES..." -f green
	Invoke-Command -Session $RemoteSession {
		# This still works: we can view local folders on machine
		dir;

		# NOW, we create a new PS-Drive to the share. (You can give it a nice name, not just one letter).
		# And provide the credential to it!
		new-psdrive  -name "MyNewDrive" -root $using:TargetFolder -PSProvider "FileSystem" -Credential $using:Credentials | out-null
		dir "MyNewDrive:\"
		remove-psdrive "MyNewDrive"
		# ^^ Remember to remove it... (though it will dissappear anyway if it doesn't have a "-persist" flag)
	}




...i.e. create a new drive, and pass the credentials in when creating that drive... and then use that new drive name, instead of the UNC path of the share.


## Historical Note

We were actually trying to copy a file, not just view a directory.

And here's something we tried along the way that failed -- but gave an error message with a hint that taught us the ps drive trick!!

	Invoke-Command -Session $remoteSession {
		copy $using:SourceFile $using:TargetFolder -credential $using:Credentials
	}


...the error message said


	The FileSystem provider supports credentials only on the New-PSDrive cmdlet. Perform the operation again without specifying credentials.
		+ CategoryInfo          : NotImplemented: (:) [], PSNotSupportedException
		+ FullyQualifiedErrorId : NotSupported
		+ PSComputerName        : YourServer.YourDomain.com


What a sneaky message!

The command we're using (copy... really it's copy-item) *has* a `credential` parameter. But with the underlying provider (`FileSystem`) -- it throws this message.

It's really giving you a clue about how to achieve the workaround. So even though they say

> Perform the operation again without specifying credentials

...what they've helped us to "think" is:

> Use `New-PsDrive` with your credential to make a new, temporary, PsDrive, and then use *that* PsDrive to achieve your File Operation!


## Credits


Big thanks to Paul Gaske for developing this as we paired on it. He has a lot of very neat powershell bits n pieces.



## See also

- [Want to prompt user for credentials and then run a script on a remote machine?](interactive_remote_script.md)
- [Resolve 502 error (proxy issue) when using Powershell Remoting](resolve_502_proxy_issue_when_remoting.md)