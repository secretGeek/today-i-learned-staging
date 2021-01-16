# Bluetooth Windows Problem with TCL Television

There is a tcl television near a particular Windows 10 Computer, as of Thursday, the 31 December 2020, 7:53 PM. 

In `Settings > Bluetooth and other devices` the television is listed there, with the name we gave it -- a 3 letter long name. Let's alias this as TIP.

TIP is listed over and over again, an endless number of times.

Deleting a single instance of this is very tedious. You have to click one of the `TIP` labels to give it focus, at which time a `Remove device` button first becomes visible. You click that a grey curtain of death descends from the sky and clouds every step you take until it clears. There is a smell of burning sulphur and distant flickers of fire. A bolt of lightning falls from the sky and pops a handful of balloons above your eyes. Once you confirm that you really would like to get rid of the device, it dissappears and only a thousand or more remain.

Where are these listed?

## Find the duplicate/repeated TCL television

You can generally find any items with a duplicate Friendly Name, by using this snippet.

It groups by friendly name, and returns the 10 most common.

	get-pnpdevice | % FriendlyName | group | sort count -desc | select -first 10

For me, today it shows 83 pnp devices named "TIP". I think my kids named the television "TIP".

I can find the "InstanceID" of those "TIP's" ...

	Get-PnpDevice | ? {$_.FriendlyName -eq "TIP" } | % InstanceID

...this returns 83 different values, that all look a bit like this...

	SWD\DAFUPNPPROVIDER\UUID:62C04512-84E3-601E-A023-70C69E4FF84D


## Disabling the device... (this failed)


I tried to remove just 1 of them, by running this command...

	> Get-PnpDevice | ? {$_.FriendlyName -eq "TIP" } | select -first 1 | disable-pnpdevice

...it asked me to confirm, which I did... then it errored, with the message below. 


	disable-pnpdevice : Generic failure
	At line:1 char:68
	+ ...  ? {$_.FriendlyName -eq "Bob" } | select -first 1 | disable-pnpdevice
	+                                                         ~ ~ ~ ~ ~ ~ ~ ~ ~
			+ CategoryInfo          : NotSpecified: (Win32_PnPEntity...4CD16-BB2B-...):ROOT\cimv2\Win32_PnPEntity) [Disable-PnpDevice], Cim
		 Exception
			+ FullyQualifiedErrorId : HRESULT 0x80041001,Disable-PnpDevice


## Deleting with `devcon.exe` ?

According to [this forum post](https://powershell.org/forums/topic/delete-hardware-device/)  maybe `devcon.exe` is a tool that can remove it.

and it lets you:

> Remove a device from the device tree and delete its device stack
>
> --[Windows Device Console (Devcon.exe)](https://docs.microsoft.com/en-us/windows-hardware/drivers/devtest/devcon)

This is part of the `WDK` - the windows development kit... seriously I feel like I'm going to have to sign up to be a third party device manufacturer in order to stop my television from being listed in an annoying place.

This is hairy Yak to the power of hairy yak.


> When you install Visual Studio 2019, select the Desktop development with C++ workload. The Windows 10 Software Development Kit (SDK) is automatically included, and is displayed in the right-hand Summary pane. Note that the version of the SDK that is compatible with the WDK for Windows 10, version 2004 may not be the default SDK. To select the correct SDK:
>
> In Visual Studio Installer, on the Individual components tab, search for Windows 10 SDK (10.0.19041.0), select this version and continue with install. Note that Visual Studio will automatically install Windows 10 SDK (10.0.19041.1) on your machine.
>
> [Download the Windows Driver Kit (WDK)](https://docs.microsoft.com/en-us/windows-hardware/drivers/download-the-wdk)

Indeed I already have a "C:\Program Files (x86)\Windows Kits\8.1" folder on my machine... but no `devcon.exe` file.

I'll modify my install and see how I go...

I'm perservering with this now just to see where I end up.


	devcon [/m:\\computer] [/r] command [arguments]

example shown is:

	devcon /r remove @usb\*


so i'll try:

	devcon /r remove SWD\DAFUPNPPROVIDER\UUID:62C04512-84E3-601E-A023-70C69E4FF84D

...and similar.

(But first I have to wait for vs2019 to install a bunch of updates, before I can even attempt the 'modify'.


## External references

 - [Windows Device Console (Devcon.exe)](https://docs.microsoft.com/en-us/windows-hardware/drivers/devtest/devcon)
 - [Download the Windows Driver Kit (WDK)](https://docs.microsoft.com/en-us/windows-hardware/drivers/download-the-wdk)
 - [Devcon Commands](https://docs.microsoft.com/en-us/windows-hardware/drivers/devtest/devcon-general-commands)
 - [Devcon `find`](https://docs.microsoft.com/en-us/windows-hardware/drivers/devtest/devcon-find)
 - [Devcon `remove`](https://docs.microsoft.com/en-us/windows-hardware/drivers/devtest/devcon-remove)
 