﻿# Treee replacement for tree

I like the `tree` command in windows but it has too few options to be useful.

I found an npm package called `tree-cli` available from <https://github.com/MrRaindrop/tree-cli>

Install it with...

	npm install -g tree-cli

And thereafter you will have `treee` available.

And you can set up an alias in your profile to use `tre` for example.

	set-alias tre treee

	tre --ignore node_modules

## Options

	> treee --help

	List contents of directories in tree-like format.

	tree - list contents of directories in tree-like format

	Tree is a recursive directory listing program that
	produces a depth indented listing of files.
	With no arguments, tree lists the files in the
	current directory. When directory arguments are
	given, tree lists all the files and/or directories
	found in the given directories each in turn. Upon
	completion of listing all files/directories found,
	tree returns the total number of files and/or
	directories listed.

	USAGE

		tree <options>

	OPTIONS:

	--help, -h
		outputs a verbose usage listing.
	--version
		outputs the version of tree-cli.
	--debug
		show debug info.
	--ignore
		ignores directory or file you specify.
	--base
		specify a root directory. Relative path from cwd root and absolute path are both acceptable.
	--fullpath
		prints the full path prefix for each file.
	--noreport
		omits printing of the file and directory report at the
		end of the tree listing and omits printing the tree on
		console.
	-a
		all files are printed. By default tree does not print
		hidden files (those beginning with a dot '.'). In no
		event does tree print the file system constructs '.'
		(current directory) and '..' (previous directory).
	-d
		list directories only.
	--directoryFirst
		list directories first.
	-f
		append a '/' for directories, a '=' for socket files
		and a '|' for FIFOs
	-i
		makes tree not print the indentation lines, useful
		when used in conjunction with the -f option.
	-l
		max display depth of the directory tree.
	-o
		send output to filename.

	EXAMPLE:

	$ tree

	$ tree -l 2, -o out.txt --ignore [node_modules, test] -d --noreport