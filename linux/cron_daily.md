# cron.daily, cron.hourly etc

On Ubuntu, you can put a shell script in one of these folders:

- `/etc/cron.daily`
- `/etc/cron.hourly`
- `/etc/cron.monthly`
- `/etc/cron.weekly`

...and it will be executed daily, hourly etc.

Or, it **should** be executed daily, weekly, hourly etc.

A couple of gotchas:

1. The file must have execute permission (see [chmod](chmod_file_permissions.md) - `test -x /file/name`)
2. The file must not have a file extension. E.g. no ".sh" on the end of the file. (It's the dot that isn't allowed.)

If you add a file to `/etc/cron.daily` and you want to know if it will be run, try this:

	run-parts --test /etc/cron.daily

...its name should be included in the output.

There is no magic to the `/etc/cron.daily` etc folders. You can see how they work by looking at `/etc/crontab`. Here's the content on a machine I know...

	# /etc/crontab: system-wide crontab
	# Unlike any other crontab you don't have to run the `crontab'
	# command to install the new version when you edit this file
	# and files in /etc/cron.d. These files also have username fields,
	# that none of the other crontabs do.

	SHELL=/bin/sh
	PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

	# m h dom mon dow user  command
	17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
	25 6    * * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )
	47 6    * * 7   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )
	52 6    1 * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )
	#

It's giving something called "anacron" the room to do the needful. But if `anacron` is not available it uses a command called "run-parts" to cron-ify the scripts in the daily/weekly/monthly folders.

"anacron" is a tool that is usually present, and it also takes responsibility for running missed jobs, if there were missed jobs.

## See also

- [cron](cron.md)
- [chmod](chmod_file_permissions.md)
