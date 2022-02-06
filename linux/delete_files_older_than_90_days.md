# Delete files older than 90 days

## Count old files

First, count files older than 90 days...

	find . -mtime +90 -type f | wc -l

Note that this is recursive... to be non-recursive:

	find . -maxdepth 1 -mtime +90 -type f | wc -l # non-recursive version

## List old files

Next, list files older than 90 days...

	find . -mtime +90 -type f

(note, could specify a specific/absolute folder instead of "." for current folder)

Note `-type f` means "files"

## Delete old files

Happy with the result? Add a `-delete` parameter to delete those files. So long, files!

	find . -mtime +90 -type f -delete

Or for 20 days...

	find . -mtime +20 -type f -delete

Cool!

## Daily CRON to delete old files from a specific folder

Now to add it to cron job, for a specific folder...

Add the following to a new file in the folder `/etc/cron.daily`

	#!/bin/sh

	find /opt/webapps/nimbletext2.com/app/DATA/NimbleText.com.Models.Usage -mtime +20 -type f -delete

And as described in [cron](cron.md) we can check the cron logs with:

	sudo grep CRON /var/log/syslog

## See also

- [cron](cron.md)
- [Count all files in a directory, recursively](count_files_recursively.md)