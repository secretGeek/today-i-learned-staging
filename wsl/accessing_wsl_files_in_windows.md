# Accessing wsl files in windows

If you have ever wanted to visit your wsl home folder from a windows computer - or navigate to your windows subsystem for linux home folder from a powershell terminal or console --

this is your lucky day.



from wsl, run this command:

	explorer.exe .

And Windows File Explorer will open, centered on a path such as...

	\\wsl.localhost\Ubuntu\home\$YOUR_LINUX_USERNAME$

And similarly, in wsl, a path like this:

	/mnt/c/Users/$YOUR_WINDOWS_USERNAME$

...will let you see into the windows users home folder.

What a world.