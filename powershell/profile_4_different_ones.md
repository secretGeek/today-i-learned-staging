﻿# In powershell you don't have 1 profile, you have 4 different ones.

List all four like this:

    $profile | get-member -type noteproperty | ft -prop Name, Definition

result:

    Name                   Definition
    ----                   ----------
    AllUsersAllHosts       string AllUsersAllHosts=C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1
    AllUsersCurrentHost    string AllUsersCurrentHost=C:\Windows\System32\WindowsPowerShell\v1.0\Microsoft.PowerShell_profile.ps1
    CurrentUserAllHosts    string CurrentUserAllHosts=C:\Users\Agatha\Documents\WindowsPowerShell\profile.ps1
    CurrentUserCurrentHost string CurrentUserCurrentHost=C:\Users\Agatha\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

And they are listed in the order in which they are loaded (if they are present that is)

 * AllUsersAllHosts      This profile applies to all users and all shells. (i.e. in Powershell, in ISE, in third party consoles.)
 * AllUsersCurrentHost   This profile applies to all users, but only in the WindowsPowerShell host. (i.e. not loaded if you are in ISE or in a third party host, unless they've gone to extra effort.)
 * CurrentUserAllHosts   This profile applies to the current user, regardless of what shell you are using.
 * CurrentUserCurrentHost   This profile applies to the current user and the current host (WindowsPowerShell) only. (i.e. not loaded if you are in ISE or in a third party host, unless they've gone to extra effort.)

### Create new file, use:

As mentioned -- the file (and even its containing folder) may not exist for you. So you need to know how to create folder and *force* the creation of the folder it is in, if needed:

    New-Item -path {filename} -type file -force

### Create new profile

This creates a new profile file, and folder if needed

    New-Item -path $profile -type file -force

## Google for profiles

To see example profiles on the internet google for either:

    inurl:Microsoft.PowerShell_profile.ps1

Or:

    inurl:profile.ps1

## See Also

 * [Create profile](create_profile.md)