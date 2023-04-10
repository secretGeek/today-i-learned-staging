# Getting Started With Scoop on Windows

As stated at <https://scoop.sh>

> Scoop installs programs you know and love, from the command line with a minimal amount of friction

To get scoop in the first place:

From Powershell:

	irm get.scoop.sh | iex

`Invoke-RestMethod`, to get the content of <get.scoop.sh> and send it to `Invoke-Expression`.

This is the sort of stuff you don't want to do when it's time to get a program... so hopefully once we've done it this once to get scoop, we'll no longer have to resort to that technique.

Or if you're new to powershell you might need to run another line first...

	Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

And then:

	irm get.scoop.sh | iex

## Output from successful installs

	> irm get.scoop.sh | iex
	Initializing...
	Downloading ...
	Creating shim...
	Adding ~\scoop\shims to your path.
	Scoop was installed successfully!
	Type 'scoop help' for instructions.

## Previous way to install scoop

Incidentally here is the older description of how it was described...

	iwr -useb get.scoop.sh | iex

That is, `Invoke-WebRequest` and use the `-UseBasicParsing` parameter.

I think that would still work. Why did the recommendation change? I'm sure it's fascinating. More restful, or better techitty tech. We saved a few characters.

## How Does Scoop Work?

It puts all packages in the folder `~\scoop`

That is scoop's "home".

## Upgrading / Updating scoop itself 



## Finding a Package with Scoop

Use "scoop search (pattern)" for example:

	scoop search chatgpt

Gives result:

	> scoop search chatgpt
	Results from local buckets...

	Name    Version Source Binaries
	----    ------- ------ --------
	chatgpt 0.12.0  extras


What are buckets?


> Scoop packages exist as a part of Git repositories, called buckets.

Oh -- repositories.

Here is a list of all the "repositories" which scoop considers to be buckets:

- <https://scoop.sh/#/buckets>

From [this webpage you can search all buckets](https://scoop.sh/#/apps), including ones that are not "official", e.g.
  
- <https://scoop.sh/#/apps?s=0&d=1&o=false&q=chatgpt>


The following buckets are "known" to scoop:

- `main` - Default bucket for the most common (mostly CLI) apps
- `extras` - Apps that don't fit the main bucket's criteria
- `games` - Open source/freeware games and game-related tools
- `nerd-fonts` - Nerd Fonts
- `nirsoft` - Almost all of the 250+ apps from Nirsoft
- `sysinternals` - Sysinternals Suite and all individual application from Microsoft
- `java` - A collection of Java development kits (JDKs), Java runtime engines (JREs), Java's virtual machine debugging tools and Java based runtime engines.
- `nonportable` - Non-portable apps (may require UAC)
- `php` - Installers for most versions of PHP
- `versions` - Alternative versions of apps found in other buckets

The main bucket is installed by default.

TO see which buckets have been installed use:

	scoop bucket list

## Adding a known bucket to scoop

i.e. Telling it about another bucket full of packages (aka Manifests) (aka another place where it call look for applications)

	scoop bucket add bucketname

...where `bucketname` is one of the known buckets above.

for example:

	scoop bucket add nirsoft

## Using Scoop to Install an application (or package or manifest)

	scoop install nimbletext

Example of the output...

	> scoop install nimbletext
	Updating Scoop...
	Updating 'extras' bucket...
	 * 548ba5d10 extraterm: Update to version 0.71.0 and fix autoupdate (#.. 3 minutes ago
	 * e1468c093 elisa: Update to version 22.12.3 and Fix autoupdate (#109.. 3 minutes ago
	 * d8d36b3cc powertoys: Update manifest (#10915)                         4 minutes ago
	 * c42b17b05 okular: Update to version 22.12.3 and Fix autoupdate (#10.. 13 minutes ago
	 * 0332d4304 kate: Update to version 22.12.3 and Fix autoupdate (#10959) 13 minutes ago
	 * 99df31b9c sweethome3d: Fix decompress error (#10939)                  39 minutes ago
	 * 0eb9d8a08 termius: Update to version 7.58.4                           4 hours ago
	Updating 'main' bucket...
	 * 65aeb53f8 terraform-provider-ibm: Update to version 1.52.1            4 hours ago
	 * b15004b33 rust-analyzer: Update to version 2023-04-10                 4 hours ago
	 * 2319f6569 jdupes: Update to version 1.22.0                            4 hours ago
	Scoop was updated successfully!
	Installing 'nimbletext' (3.1.0.33266) [64bit] from extras bucket
	NimbleText.exe (773.5 KB) [===================================================================================] 100%
	Checking hash of NimbleText.exe ... ok.
	Linking ~\scoop\apps\nimbletext\current => ~\scoop\apps\nimbletext\3.1.0.33266
	Creating shim for 'NimbleText'.
	Creating shortcut for NimbleText (NimbleText.exe)
	'nimbletext' (3.1.0.33266) was installed successfully!

## Another example of searching with scoop search

	> scoop search python
	
	Results from local buckets...

	Name       Version  Source Binaries
	----       -------  ------ --------
	anaconda3  2023.03  extras python.exe | pythonw.exe | python.exe
	fontforge  20230101 extras ffpython.exe
	mambaforge 23.1.0-1 extras python.exe | pythonw.exe | python.exe
	miniconda3 23.1.0-1 extras python.exe | pythonw.exe | python.exe
	paraview   5.11.1   extras pvpython.exe
	python     3.11.3   main
	winpython  3.10.9.0 main




## Using Scoop to Update a Package

## Using Scoop to remove a local package

	scoop bucket rm the-package-name



## Add VS Code Integration

First I need to make sure the known bucket `extras` was made available.

	scoop bucket add extras

Extras is a bucket that lists ~ 1787 applications.

And the result of the above command is this:

	> scoop bucket add extras
	Checking repo... OK
	The extras bucket was added successfully.

What can we do now?

At this point here is my scoop home tree:

	├───apps
	│   └───scoop
	│       └───current
	│           ├───.github
	│           │   ├───ISSUE_TEMPLATE
	│           │   └───workflows
	│           ├───.vscode
	│           ├───bin
	│           ├───lib
	│           ├───libexec
	│           ├───supporting
	│           │   ├───formats
	│           │   ├───shimexe
	│           │   │   └───bin
	│           │   ├───shims
	│           │   │   ├───71
	│           │   │   └───kiennq
	│           │   └───validator
	│           │       └───bin
	│           └───test
	│               ├───bin
	│               └───fixtures
	│                   ├───decompress
	│                   ├───format
	│                   │   ├───formatted
	│                   │   └───unformatted
	│                   ├───is_directory
	│                   │   └───i_am_a_directory
	│                   ├───manifest
	│                   ├───movedir
	│                   │   ├───user
	│                   │   │   └───_tmp
	│                   │   │       └───subdir
	│                   │   ├───user with 'quote
	│                   │   │   └───_tmp
	│                   │   │       └───subdir
	│                   │   └───user with space
	│                   │       └───_tmp
	│                   │           └───subdir
	│                   └───shim
	│                       └───user with 'quote
	├───buckets
	│   ├───extras
	│   │   ├───.github
	│   │   │   ├───ISSUE_TEMPLATE
	│   │   │   └───workflows
	│   │   ├───.vscode
	│   │   ├───bin
	│   │   ├───bucket
	│   │   ├───deprecated
	│   │   └───scripts
	│   │       ├───beyondcompare
	│   │       ├───coretemp
	│   │       ├───eartrumpet
	│   │       ├───everything
	│   │       ├───gimp
	│   │       ├───grepwin
	│   │       ├───harmonoid
	│   │       ├───jetbrains
	│   │       ├───lockhunter
	│   │       ├───notepad3
	│   │       ├───notepadplusplus
	│   │       ├───nvda
	│   │       ├───phoenix-protector
	│   │       ├───picotorrent
	│   │       ├───recaps
	│   │       ├───sublime-text
	│   │       ├───tachidesk-server
	│   │       ├───tailscale
	│   │       ├───tortoisesvn
	│   │       ├───vscode
	│   │       ├───windows-terminal
	│   │       ├───wsa-pacman
	│   │       ├───xdman
	│   │       └───zlib
	│   └───main
	│       ├───.github
	│       │   ├───ISSUE_TEMPLATE
	│       │   └───workflows
	│       ├───.vscode
	│       ├───bin
	│       ├───bucket
	│       ├───deprecated
	│       └───scripts
	│           ├───7-zip
	│           ├───git
	│           ├───pwsh
	│           ├───python
	│           ├───vim
	│           └───vulkan
	└───shims

