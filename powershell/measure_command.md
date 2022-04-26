# Measure-Command is how to measure the time to run a command in powershell



	$timeofCommand = measure-command {
		# DO SOME SLOW/TRICKY COMMAND HERE...
		start-sleep -Seconds 3
	}
	write-host "Command took: $($timeofCommand.TotalMilliseconds)ms"  -f cyan;

Output:

	Command took: 3012.6474ms



And here it is in a one liner...


	(measure-command {  start-sleep -Seconds 1;  }).TotalMilliseconds

Or:	
	
	measure-command {  start-sleep -Seconds 1;  } | % TotalMilliseconds
	
Or just...

	measure-command {  start-sleep -Seconds 1;  }
	
