# Find which .net versions you have



## On Windows 10 or 11

    reg query "HKLM\SOFTWARE\Microsoft\Net Framework Setup\NDP" /s | 
		? { $_ -like "*version*" } | 
		% { ($_ -split " ") | 
		? { $_ -match "[0-9.]+" } | 
				% { $_ } 
			} |
		sort -desc |
		unique

Gives output such as --


	4.8.09032
	4.0.0.0
	4.0.0
	3.5.30729.4926
	3.0.6920.4902
	3.0.4506.4926
	3.0.4203.4926
	3.0.30729.4926
	3.0.0.0
	2.0.50727.4927


## Windows - looking for .net version post "framework"

dotnet --list-runtimes


## On ubuntu linux




	dpkg --get-selections | grep -v deinstall | grep dot


