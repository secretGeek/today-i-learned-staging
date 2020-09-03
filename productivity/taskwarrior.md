# Using TaskWarrior on Windows

Install on [WSL (windows subsystem for linux)](../windows/bash_on_windows.md) with:

	sudo apt-get install taskwarrior

If messages are happy then you succeeded.

Type `task` to see if it's there....

	$ task
	A configuration file could not be found in

	Would you like a sample /home/myuser/.taskrc created, so Taskwarrior can proceed? (yes/no) y
	[task next]
	No matches.


- `Task help` -- gives help (bit technical for right now though)

# Add a really plain task...


	task add buy milk

...this is how it plays out:

	$ task add buy milk
	Created task 1.

Now see all your tasks...

	$ task
	[task next]

	ID Age Description  Urg
	 1 1s  buy milk    0

	1 task	

See that the current task id for that task is "1". (It's actual primary key is hidden and won't change.)

# Mark a task as done

Mark that task as done like this:

	task 1 done

Result:

	~$ task 1 done
	Completed task 1 'buy milk'.
	Completed 1 task.

Now -- add a fresh task such as:

	task add learn to use task warrior

You'll see (when you run `task`) that this new task is now listed as number 1.


## Add a tag to a task

When adding a new task you can give it a `tag` like this:

	task add learn about tags +tw

(the tag here is "tw" and the task is "learn more about tags")

## Add multiple tags to a task

Just list them all with a plus before each:

	task add learn more about tags +tw +tags +example

Or add another `tag` to an existing task like this:

	task 1 modify +tw
	
(Added the tag "tw". Obviously you could've added more than 1 at once, with `+tw +fun +easy` etc.)

## Remove a tag from a task

Remove a `tag` by using minues (`-`) e.g.

	task 1 modify -tw

(Removed the tag `tw` from task 1)

## Add AND Remove...

	task 1 modify -tw +tech

(Removed `tw` and added `tech` to task 1)


## Add a tag to all tasks

If we leave out the number, then we are asking to apply the behaviour to *all*... 

	task modify +tw

...and it is careful to make sure we mean it (we have to confirm sort of twice...)....

	This command has no filter, and will modify all tasks.  Are you sure? (yes/no) y
		- Tags will be set to 'tw'.

...We say "y" for yes, and then it asks for the next task... we say "a" for "all", and boom it's done.

Ah -- lesson here is that a command can apply to many tasks. THat little number we use is a "filter" saying "where ID = 1".

## List tasks with a tag

	task list +todo
	
...lists tasks with `todo` tag.

Or - list those that have some tags and don't have other tags...

	task list +shop -grocery

(things to buy at the shop but that are not grocery items)

...in fact leave out the `list` command and you get the same...

	task list +todo

and

	task +shop -grocery

...lists tasks that have/lack those tags.

## List all completed tasks


This worked...

	task status:completed all

I learned also that I can see *all* tasks open or closed with:

	task all


## List all tasks completed today


## Set no priority to be higher than 'low' priority

As described here [taskwarrior priority](https://taskwarrior.org/docs/priority.html), priority is a user-defined attribute.

Inline with the talk i watched, here is how you can configure taskwarrior's "priorities" such that "no priority" is higher priority than "low priority" -- like so:

	task config -- uda.priority.values  H,M,,L

...it asked me to confirm first, and then it added this line to ".taskrc"


	uda.priority.values=H,M,,L

Easy.


## .taskrc file: what is in there?


remember it created a `.taskrc` file for me, automatucally? let's inspect that!

  $ cat .taskrc


	# [Created by task 2.5.1 9/3/2020 16:31:00]
	# Taskwarrior program configuration file.
	# For more documentation, see http://taskwarrior.org or try 'man task', 'man task-color',
	# 'man task-sync' or 'man taskrc'

	# Here is an example of entries that use the default, override and blank values
	#   variable=foo   -- By specifying a value, this overrides the default
	#   variable=      -- By specifying no value, this means no default
	#   #variable=foo  -- By commenting out the line, or deleting it, this uses the default

	# Use the command 'task show' to see all defaults and overrides

	# Files
	data.location=~/.task

	# Color theme (uncomment one to use)
	#include /usr/share/taskwarrior/light-16.theme
	#include /usr/share/taskwarrior/light-256.theme
	#include /usr/share/taskwarrior/dark-16.theme
	#include /usr/share/taskwarrior/dark-256.theme
	#include /usr/share/taskwarrior/dark-red-256.theme
	#include /usr/share/taskwarrior/dark-green-256.theme
	#include /usr/share/taskwarrior/dark-blue-256.theme
	#include /usr/share/taskwarrior/dark-violets-256.theme
	#include /usr/share/taskwarrior/dark-yellow-green.theme
	#include /usr/share/taskwarrior/dark-gray-256.theme
	#include /usr/share/taskwarrior/dark-gray-blue-256.theme
	#include /usr/share/taskwarrior/solarized-dark-256.theme
	#include /usr/share/taskwarrior/solarized-light-256.theme
	#include /usr/share/taskwarrior/no-color.theme


Oh I see -- all the data is in a `.tasks` directory. Fun fun!!



## sources

- [30 second guide](https://taskwarrior.org/docs/30second.html)
- [30 minute talk](https://www.youtube.com/watch?&v=zl68asL9jZA) by [Paul Fenwick](https://twitter.com/pjf)