# How to call command line apps like a powershell pro

Call command line apps via powershell like this:

	$arguments = @("/i", $msiInstallPath, "/L* $msiInstallPath.log", "/qn", "/norestart")
	$process = Start-Process -FilePath "msiexec.exe" -ArgumentList $arguments -Wait -PassThru

That's how the professionals do it. And so should you. Allegedly.

(It's sending an array as the argument list)
