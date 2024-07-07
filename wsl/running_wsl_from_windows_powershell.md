# Running WSL from Windows Powershell Terminal


I was told it was this easy...


	wsl -e "simple_script.sh"

But that resulted in a whole heck of a lot of errors like this:


	> wsl.exe -e "ls"
	<3>WSL (9) ERROR: CreateProcessParseCommon:711: Failed to translate \\wsl.localhost\Ubuntu\home\nosferatu
	<3>WSL (9) ERROR: CreateProcessParseCommon:757: getpwuid(0) failed 2
	<3>WSL (9) ERROR: UtilTranslatePathList:2866: Failed to translate C:\Program Files\PowerShell\7
	<3>WSL (9) ERROR: UtilTranslatePathList:2866: Failed to translate C:\Program Files (x86)\Common Files\Oracle\Java\javapath
	<3>WSL (9) ERROR: UtilTranslatePathList:2866: Failed to translate C:\Program Files\PowerShell\7
	<3>WSL (9) ERROR: UtilTranslatePathList:2866: Failed to translate C:\Program Files\Microsoft\jdk-11.0.20.8-hotspot\bin
	<3>WSL (9) ERROR: UtilTranslatePathList:2866: Failed to translate C:\Program Files (x86)\Microsoft SDKs\Azure\CLI2\wbin
	<3>WSL (9) ERROR: UtilTranslatePathList:2866: Failed to translate C:\Program Files\Volta\
	<3>WSL (9) ERROR: UtilTranslatePathList:2866: Failed to translate C:\Program Files\Eclipse Foundation\jdk-8.0.302.8-hotspot\bin
	<3>WSL (9) ERROR: UtilTranslatePathList:2866: Failed to translate C:\Program Files\Microsoft\jdk-11.0.12.7-hotspot\bin
	<3>WSL (9) ERROR: UtilTranslatePathList:2866: Failed to translate C:\Program Files\Eclipse Adoptium\jdk-17.0.1.12-hotspot\bin


Normally when I run wsl, I run it via a function of mine called `bash` -- and what it eventually does is call:

	wsl.exe -d Ubuntu;

And I've just read that -- to set the default profile of Ubuntu you can do this: 
	

	wsl --setdefault Ubuntu

So I did that.


AND THEN THE ERROR WENT AWAY!


So -- this error:


	<3>WSL (9) ERROR: CreateProcessParseCommon:711: Failed to translate \\wsl.localhost\Ubuntu\home\nosferatu


MEANS --

	I don't know what profile to use by default when running WSL!


Go figure!



	wsl.exe -e "ls" | % { wh "- $_  " -f red -n}
	
	<3>WSL (9) ERROR: CreateProcessParseCommon:711: Failed to translate \\wsl.localhost\Ubuntu\home\nosferatu