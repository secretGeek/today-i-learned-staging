# Volta - node version manager

Volta is a cross platform node version manager – this guide is specific to issues that arise when running it on windows and providers a comparison to using Volta on Windows versus nvm for Windows. For more on `nvm` see [Node Version Manager (NVM)](nvm.md)

As stated in the getting started guide for Volta:

> Volta's functionality depends on creating symlinks, so you must either:
>
> - Enable Developer Mode (recommended)
> - Run Volta with elevated privileges (not recommended)

See that? Once you enable "Developer Mode" in Windows, you can use symlinks without running as admin. (In linux & Unix, symlinks are a very commonly used OS feature and don't need root/sudo/admin permissions to be used.)

To enable developer mode:

- In Windows search, search for Settings: Developer Settings
- This shows you a section under "Privacy & Security" that groups together a bunch of settings that developers are interested in.
- The first one, "Developer Mode" allows a few features, but it also allows symlinks to be used/created by non-admin apps. (As it should!)

## Comparison of NVM (for Windows) and ⚡Volta⚡ (for Windows)

Both are capable of doing their prescribed task.

NVM for Windows requires an elevated console.

NVM also has the drawback that it is not the other more famous nvm, so when searching for help or information, or hearing about nvm's features… much of it does not apply. 🥹

Be warned though: Volta and NVM do not work **TOGETHEER**. Once you have installed Volta on Windows, you can probably no longer use nvm for windows.

Watch this:

I have both nvm and volta installed… let's see where powershell or cmd.exe locate the "node" command...

In powershell:

```powershell
C:\> get-command node

Name     Source
----     ------
node.exe C:\Program Files\Volta\node.exe

C:\> get-command npm

Name    Source
----    ------
npm.exe C:\Program Files\Volta\npm.exe
```

With Both nvm and volta installed – **Volta** dictated which version of node and npm are available.
 

In cmd.exe, we can use the where command to get more information about the various programs that match…

```shell
C:\>where node
C:\Program Files\Volta\node.exe
C:\Program Files\nodejs\node.exe

>where npm
C:\Program Files\Volta\npm.cmd
C:\Program Files\Volta\npm.exe
C:\Program Files\nodejs\npm
C:\Program Files\nodejs\npm.cmd
```


We see that even though node and npm are both available from more than one location, the *Volta* instance is discovered **first**.

When looking at my `%path%` (`$env:path` in powershell) environment variable I can see that this is because Volta has placed itself at the absolute start of the list. Good work Volta. You win. (It does make sense: if Volta wants to control the version of Node/Npm it is more effectively able to do this from the front of the path.)

To find out "which" actual file on your computer will be used by Volta for a given tool, use volta's which command --


> volta which node
C:\Users\user1\AppData\Local\Volta\tools\image\node\18.16.0\node.exe
Using Volta
Install Volta from the Official Website after enabling Developer mode as described above.

See which versions of node have been installed / controlled by Volta:

```powershell
 volta list node
⚡️ Node runtimes in your toolchain:

    v14.21.3
    v16.15.0
    v18.16.0 (default)
``` 


Install the latest version of node:

```powershell
volta install node
```
Install the latest `14.*` version of node (that is, the latest within the `14.*` range...)

```powershell
volta install node@14
```
Install a specific version of node:

```powershell
volta install node@16.15.0
```


## See also

- [Node Version Manager (NVM)](nvm.md)