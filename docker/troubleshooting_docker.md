# Troubleshooting Docker Desktop on Windows

I've seen guides that say the best troubleshooting step is to completely uninstall and reinstall docker desktop. That doesn't seem like a "troubleshooting" option to me. That's more like a "nuke the planet from orbit" option.

- Sometimes docker won't start -- or it just says "starting" for a very long time.

You can view the logs of docker here:

	cd $env:LOCALAPPDATA\Docker\log\vm\

One thing that goes wrong for me -- is a certain container that is configured to restart every time docker starts.

I need to tell that container to only start when it is manually asked to restart. It doesn't cause a problem apart from when Windows is rebooted by an update. Then it stops Docker from starting, from completing its starts. It starts to start, but never stops starting.
