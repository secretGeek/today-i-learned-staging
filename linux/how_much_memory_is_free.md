# How much memory is free?

A common way...

	$ top

(And the newer and prettier `htop`)


Also

	$ free -m
	              total        used        free      shared  buff/cache   available
	Mem:            488         228          23          11         236         217
	Swap:             0           0           0

The figure under "available" is how much is "Free and available"

i.e. what humans usually mean when they say "free"

To watch it as it changes...

	$ watch -n 5 free -m

This will refresh every 5 seconds.

Another techinique:

	$ cat /proc/meminfo | grep MemAvailable

	MemAvailable:     223336 kB

And similarly:

	$ watch -n 5 'cat /proc/meminfo | grep MemAvailable'


## How much are particular apps using?

Sort the current processes by memory usage


    ps aux --sort=-%mem | head

Note, see also [explain shell for this command](https://www.explainshell.com/explain?cmd=ps+aux+--sort%3D-%25mem+%7C+head)

Columns of `ps aux`


- `USER`
- `PID`
- `%CPU`
- `%MEM`
- `VSZ` -- Virtual Memory Size, in Kb
- `RSS` -- Resident Set Size, in Kb
- `TTY`
- `STAT`
- `START`
- `TIME`
- `COMMAND`  e.g. `/usr/bin/dotnet /opt/webapps/example.com/app/example.dll`

Quickly explanations:

- `Virtual Memory` Size is how much the operating system has been told to set aside for the process, but probably is not all in use.
- `Resident Set Size` is how much is residing in memory that this app can access... the trick though is that there might be resources counted in there that are used by multiple apps. So, killing one app won't necessarily free this much memory.
- ...and read more here: [ps output - Difference between VSZ vs RSS memory usage - Linux Tutorials - Learn Linux Configuration](https://linuxconfig.org/ps-output-difference-between-vsz-vs-rss-memory-usage)


## Machine information

Related -- 

To see a lot of specific info about your machine...

	$ sudo lshw

Meaning: "list hardware"


## External Resources

- [Linux Ate My Ram](http://www.linuxatemyram.com/)
- [ps output - Difference between VSZ vs RSS memory usage - Linux Tutorials - Learn Linux Configuration](https://linuxconfig.org/ps-output-difference-between-vsz-vs-rss-memory-usage)
- [explainshell.com for `ps aux --sort=-%mem | head`](https://www.explainshell.com/explain?cmd=ps+aux+--sort%3D-%25mem+%7C+head)

## See also

- [Supervisor... it keeps your app running!](supervisor.md) - see how much supervisor is using
