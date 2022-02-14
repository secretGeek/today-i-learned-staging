# Filename too long when cloning a git repository on windows

Windows was previously limited to having filepaths no longer than 260 chars. Since Windows 10 it *can* handle longer paths, but you need to opt in.

If you clone a repo with names longer than that [1](#footnote-1), you will receive errors about "filename too long" 

You can configure git to handle those long names like so:

	git config --global core.longpaths true

That changes the limit to 4096 chars.

But on navigating into certain folders you'll still find the commandline is not happy. You need to also tell windows to do better:

But even then, commands such as `git status` will fail with this message:

```plaintext
Program 'git.exe' failed to run: The directory name is invalidAt line:1 char:1
+ git status
```

The trick here is to update the dreaded windows registry like so:

```powershell
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" `
-Name "LongPathsEnabled" -Value 1 -PropertyType DWORD -Force
```

...and then restart your computer.

Source #2 also recommends:

1. Windows Run `gpedit.msc`
2. Navigate to:

      Computer Configuration | Administrative Templates | System | Filesystem | Enable Win32 long paths
	  
3. Set state to "Enabled"


But even after restarting this is not enough for me to use git succesfully in such folders.

Not sure what else I'm nmissing.

Perhaps Powershell or Windows Terminal need to be helped along.

I can see the config for powershell here:

	cat C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe.config

And today it says:	

```xml
<configuration>
  <uri>
	<schemeSettings>
	  <add name="http" genericUriParserOptions="DontUnescapePathDotsAndSlashes"/>
	  <add name="https" genericUriParserOptions="DontUnescapePathDotsAndSlashes"/>
	</schemeSettings>
  </uri>
  <runtime>
	<AppContextSwitchOverrides value="Switch.System.Net.DontEnableSystemDefaultTlsVersions=false" />
  </runtime>
</configuration>
```

That told me nothing. I instead used `mt.exe` -- the manifest tool installed with Visual Studio. I ran a "Visual Studio Command Prompt" -- then used this command:

```powershell
mt -inputresource:C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -out:powershell.manifest
```

And it produced a file, `powershell.manifest` that looked like this:

```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<assembly xmlns="urn:schemas-microsoft-com:asm.v1" manifestVersion="1.0">
  <description>PowerShell</description>
  <trustInfo xmlns="urn:schemas-microsoft-com:asm.v3">
    <security>
      <requestedPrivileges>
        <requestedExecutionLevel level="asInvoker" uiAccess="false"></requestedExecutionLevel>
      </requestedPrivileges>
    </security>
  </trustInfo>
  <compatibility xmlns="urn:schemas-microsoft-com:compatibility.v1"> 
    <application> 
      <!--This Id value indicates the application supports Windows Vista/Server 2008 functionality -->
      <supportedOS Id="{e2011457-1546-43c5-a5fe-008deee3d3f0}"></supportedOS> 
      <!--This Id value indicates the application supports Windows 7/Server 2008 R2 functionality-->
      <supportedOS Id="{35138b9a-5d96-4fbd-8e2d-a2440225f93a}"></supportedOS>
      <!--This Id value indicates the application supports Windows 8/Server 2012 functionality-->
      <supportedOS Id="{4a2f28e3-53b9-4441-ba9c-d69d4a4a6e38}"></supportedOS>
      <!-- This Id value indicates the application supports Windows Blue/Server 2012 R2 functionality-->            
      <supportedOS Id="{1f676c76-80e1-4239-95bb-83d0f6d0da78}"></supportedOS>
      <!-- This Id value indicates the application supports Windows Threshold functionality-->            
      <supportedOS Id="{8e0f7a12-bfb3-4fe8-b9a5-48fd50a15a9a}"></supportedOS>
    </application> 
  </compatibility>
  <application xmlns="urn:schemas-microsoft-com:asm.v3">
    <windowsSettings>
      <longPathAware xmlns="http://schemas.microsoft.com/SMI/2016/WindowsSettings">true</longPathAware>
    </windowsSettings>
  </application>
</assembly>
```

....note the line: `<longPathAware xmlns="http://schemas.microsoft.com/SMI/2016/WindowsSettings">true</longPathAware>`

## Bonus content re .Net Apps...

Some applications, such as .net applications can support long filenames -- but they must have "long path aware" specifiec in their manifest.

See (for example) [.NET 4.6.2 and long paths on Windows 10 | Microsoft Docs](https://docs.microsoft.com/en-gb/archive/blogs/jeremykuhne/net-4-6-2-and-long-paths-on-windows-10)

```xml
<application xmlns="urn:schemas-microsoft-com:asm.v3">
  <windowsSettings>
	<longPathAware xmlns="https://schemas.microsoft.com/SMI/2016/WindowsSettings">true</longPathAware>
  </windowsSettings>
</application>
```

## Footnotes

### Footnote 1

> names longer than that

...means longer than 260 characters, *including* the length of the root location into which you are cloning the repo, plus the length of the name of the folder the repo is in.
	
## Source

- [Git checkouts fail on Windows with "Filename too long error: unable to create file" errors](https://confluence.atlassian.com/bamkb/git-checkouts-fail-on-windows-with-filename-too-long-error-unable-to-create-file-errors-867363792.html
- [Git clone error: Filename too long on Windows 10](https://devopsjournal.io/blog/2020/09/23/Git-clone-Filename-too-long-Windows)
- [.NET 4.6.2 and long paths on Windows 10 | Microsoft Docs](https://docs.microsoft.com/en-gb/archive/blogs/jeremykuhne/net-4-6-2-and-long-paths-on-windows-10)