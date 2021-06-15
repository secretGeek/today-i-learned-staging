# Use mstsc.exe to connect, receive Black screen

After logging into a remote computer with remote desktop (rdp via mstsc.exe) the screen goes black!

Clicking, tapping, moving your mouse, resizing the window -- nothing seems to make a difference! What's going on! Have you been hacked by goths?

The trick is to press `Ctrl + Alt + End`

...which:

> Brings up the Windows Security dialog box for the Remote Desktop Session Host (RD Session Host) (provides the same functionality as pressing CTRL+ALT+DEL on the local computer).

This forces the entire screen to redraw, and thus invalidates the bitmap cache.

The alternative is to change your remote desktop connection options (under "Experience" tab) :  Uncheck "Persistent bitmap caching"

## Source

- [why is my screen black after rdp connection?](http://superuser.com/questions/306412/why-is-my-screen-black-after-rdp-connection)
- [Remote Desktop Services Shortcut Keys](https://msdn.microsoft.com/en-us/library/aa383500.aspx)

## See also

- [Terminal services client, without a mouse](..\windows\mstsc_without_mouse.md)
- [How to best configure and use mstsc.exe - microsoft terminal services client](..\mstsc\how_to_best_configure_and_use_mstsc.md)