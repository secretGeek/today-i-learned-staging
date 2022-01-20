# Repeat every n seconds forever

Repeat a command, on a loop, so you can monitor a process.

I wanted to repeat this every 5 seconds:

	dir . *.* -recurse | measure | % Count

And used this command to achieve it:

	cls; while ($true) { dir . *.* -recurse | measure | % Count; start-sleep -seconds 5; }

## Poll File Size

This example will show you the file size, every second (expressed in GB)

	while($true) { dir *wellsrv* | % { $_.Length / 1gb; sleep 1} }

## Poll disk space

	while($true) { get-psdrive c | % { $_.Free / 1GB; sleep 3} }

## Poll Current Time, FileName and Size

Here's one that shows the current time, the file name and size every 30 seconds

	while($true) { dir outputlog.txt | % {
				"" +  (get-date -f "yyyy-MM-dd HH:mm:ss") +
				": " + ($_.Name) +
				", " + ($_.Length / 1gb) +
				" GB";
				sleep 30
				}
	}

## Poll Space Used and remaining

Here's one that shows how much space is left on the drive...

	while (1) {
		get-psdrive C |
			% {
				"" + "{0:0.00}" -f ($_.Used/1GB) + " used, " +
				"{0:0.00}" -f ($_.Free/1GB)   + " free"
			};
			sleep 3;
	}

## Making repeats obvious

I had a recurring script like the ones above, and it started by clearing the screen and then giving some output.

It was too quick though -- I couldn't tell if it had worked once and hung, or was just getting the same output every time.

So I added this just before the clear screen: `write-host "Checking..." -f yellow; start-sleep -seconds 1;`


That is, the script ended like this:

	start-sleep -seconds 5;
	write-host "Checking..." -f yellow;
	start-sleep -seconds 1;
	cls;

It would say "Checking..." in yellow, at the end of other output, for 1 second, before it cleared the screen and repeated the command that was being run.


## See also

- [example of using 'watch' in linux](../linux/how_much_memory_is_free.md)
