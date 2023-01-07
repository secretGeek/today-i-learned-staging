# chmod - and the magic of file permissions

## Allow everything

	chmod 777 /opt/webapps

Causes these permissions:

	drwxrwxrwx

How is this true? What does this mean?

	777 -- three digits, each digit is the value of 3 flags, 3 bits.

- `7`, in binary, is `111`.

Each digit refers to three different groups:

This

	drwxrwxrwx

...can be broken out into 4 categories:

	d  rwx   rwx   rwx

Concentrate on those last three, the repeated 'rwx's...

	 +---------------  Permissions of the owner of the file,
	 |     +---------  The group associated with the file, and
	 |     |     +---  Everybody else.
	 |     |     |
	rwx   rwx   rwx
	|||   |||   |||
	|||   |||   ||+-- execute permission for everybody else
	|||   |||   |+--- write permission for everybody else
	|||   |||   +---- read permission for everybody else
	|||   |||
	|||   ||+-- execute permission for the group associated with the file
	|||   |+--- write permission for the group associated with the file
	|||   +---- read permission for the group associated with the file
	|||
	||+-- execute permission for the owner of the file
	|+--- write permission for the owner of the file
	+---- read permission for the owner of the file

- `r` = read permission
- `w` = write permission
- `x` = execute permission

If a permission was missing it would be represented by a dash '-'.

## The Building Blocks of a permission

	---   No read, no write, no execute = 0
	--x   Execute (not read or write) = 1
	-w-   Write (not read or execute) = 2
	r--   Read (not execute or write) = 4

All permissions are made by adding some combination of 0,1,2,4.

## Common patterns

### 600: Owner can read write but not execute, no one else can read write

	sudo chmod 600 ~/.ssh/id_dsa

### 777: Everyone can do everything

	sudo chmod 777 /public/publicfile

## Common combos

	r-x   Read Execute, Not write = 5
	rw-   Read Write, Not execute = 6
	rwx   Read Write and Execute = 7

## Add read (or write, or execute)

If all you want to do is "add read permissions" (for example) you can use this syntax:

	chmod +r /public/README.md

or add write permissions:

	chmod +w /public/README.md

or add eXecute permissions:

	chmod +x /public/README.md

## Test file permissions with `test`

The `test` command is often used in scripts for testing the `r`,`w` or `x` flag of a file.

e.g.

   test -x /public/deleteEverything

Means "does the file `/public/deleteEverything` exist? and if so, does it have the `x` (execute) bit set?

Similarly:

   test -r /public/README.md
   test -w /public/README.md

And output success or fail, with:

	test -x /home/leon/.templateengine && echo "The file has the execute flag"
	test -x /home/leon/.templateengine || echo "The file does not exist or it does exist but does not have the execute flag"

## Related commands

- `chmod` - modify permissions
- `chown` - change the owner of the file
- `chgrp` - change the group

## See also

- [ssh](SSH.md)
