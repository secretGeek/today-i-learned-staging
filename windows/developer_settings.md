# Developer Settings -- Developer Mode on Windows

In Windows search, search for Settings: Developer Settings

This shows you a section under "Privacy & Security" that groups together a bunch of settings that developer are interested in. 

The first one, "Developer Mode" allows a few features, but allegedly it allows symlinks to be used/created by non-admin apps. (As it should!)

I needed that so I could use [Volta](https://volta.sh/) (a node version manager) without having to run as admin.

> Volta's functionality depends on creating symlinks, so you must either:
>
> - Enable Developer Mode (recommended)
> - Run Volta with elevated privileges (not recommended)
>
> -- [Volta: Getting Started](https://docs.volta.sh/guide/getting-started)


The "For Developers" dialog is also a handy place to adjust File Explorer settings, set Powershell execution policy, and choose the default app to host command-line interfaces (i.e. [Windows Terminal](../microsoft_terminal/microsoft_terminal_settings.md) over `cmd.exe`)

## Sources

- [Microsoft: Enable your device for development](https://learn.microsoft.com/en-us/windows/apps/get-started/enable-your-device-for-development#accessing-settings-for-developers)
- [Volta: Getting Started](https://docs.volta.sh/guide/getting-started)
- [Volta](https://volta.sh/)

## See also

- [Windows Terminal](../microsoft_terminal/microsoft_terminal_settings.md)
- [Node/nvm](../node/nvm.md)
