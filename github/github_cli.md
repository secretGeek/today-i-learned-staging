# Github cli

Before I launch into enthusiastically installing and using the github cli (affectionately known as `gh`) let me firstly say that THIS IS A TRAP.

Github want you to be locked into their ecosystem - so they can't just have you use `git` - which is open source. They want you to be addicted to their "value adding" moat, and `gh` is a part of that plan!

==Don't be fooled, people! Stay platform independent!==

But... surely a little `gh` won't hurt...

## Install with winget

	winget install GitHub.cli

(See "[Getting Started with Winget](../winget/getting_started.md)" if you need to)

## Once only: Authorize the app

	gh auth login

Okay this seemed easy, output:

	> gh auth login
	? What account do you want to log into? GitHub.com
	? You're already logged into github.com. Do you want to re-authenticate? No

## General usage

	gh <command> <subcommand> [flags]

## Core Commands

- `gh gist`:       Manage gists
- `gh issue`:      Manage issues
- `gh pr`:         Manage pull requests
- `gh release`:    Manage GitHub releases
- `gh repo`:       Create, clone, fork, and view repositories

Use `gh <command> <subcommand> --help` for more information about a command.

## Additional Commands

- `gh alias`:      Create command shortcuts
- `gh api`:        Make an authenticated GitHub API request
- `gh auth`:       Login, logout, and refresh your authentication
- `gh completion`: Generate shell completion scripts
- `gh config`:     Manage configuration for gh
- `gh help`:       Help about any command
- `gh secret`:     Manage GitHub secrets
- `gh ssh-key`:    Manage SSH keys

Further info:

	FLAGS
		--help      Show help for command
		--version   Show gh version

	EXAMPLES
		$ gh issue create
		$ gh repo clone cli/cli
		$ gh pr checkout 321

## Create new repo

	gh repo create [<name>] [flags]

```plaintext
Flags:
-y,	--confirm               Skip the confirmation prompt
-d,	--description string    Description of the repository
		--enable-issues         Enable issues in the new repository (default true)
		--enable-wiki           Enable wiki in the new repository (default true)
-h,	--homepage URL          Repository home page URL
		--internal              Make the new repository internal
		--private               Make the new repository private
		--public                Make the new repository public
-t,	--team name             The name of the organization team to be granted access
-p,	--template repository   Make the new repository based on a template repository
```

## Gather a list of all my issues

Now I wasn't doing this for fun. WHat I want is a list of all my open issues. Or just "all my issues" will do.

Here's how I can get it...

### First write a list of all my repos into a single file

(This assumes I have less than 500 repos.)

	# first write a header row to the file
	"repo	description	pubpriv	updated" | out-file gh_repos.tsv -encoding utf8;

	# now write the list of repos...
	gh repo list -L 500 | out-file gh_repos.tsv -append -encoding utf8;

### Use that list to get my full list of issues

	# first write a header row to the file
	"repo	id	status	subject	modified" | out-file gh_issues.tsv -encoding utf8;

	# now write all the issues themselves, for each repo listed in repolist
	Import-Csv -Delimiter "`t" -Path .\gh_repos.tsv |
		% { $repo = $_.repo; gh issue list --repo $_.repo } |
		% { "$repo`t$($_)" } | out-file "gh_issues.tsv" -encoding utf8

## External references

- [Hanselman: github command line](https://www.hanselman.com/blog/dont-forget-about-the-github-command-line)
- [source of gh cli](https://github.com/cli/cli)

## See also

- [Getting Started with Winget](../winget/getting_started.md)