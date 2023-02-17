# The Github Cli

Github released a [CLI](https://github.com/cli/cli) -- not for doing git stuff exactly. More for doing things at a github level, with a repo, or outside of any repo.

## Install

For windows, on WinGet, install like this:

	winget install --id GitHub.cli

(or with scoop: `scoop install gh`, or chocolatey: `choco install gh`)

## Basic Usage

	gh <command> <subcommand> [flags]

## Commands

### Core Commands

	browse:     Open the repository in the browser
	gist:       Manage gists
	issue:      Manage issues
	pr:         Manage pull requests
	release:    Manage GitHub releases
	repo:       Create, clone, fork, and view repositories

#### gh repo

- [gh repo](https://cli.github.com/manual/gh_repo)
  - [gh repo create](https://cli.github.com/manual/gh_repo_create) - I use this all the time. `gh repo create` with no other parameters give you a fun wizard that helps you create an empty repo, private or public, with license and [`.gitignore`](gitignore.md).
  - [gh repo list](https://cli.github.com/manual/gh_repo_list)
  - [gh repo view](https://cli.github.com/manual/gh_repo_view)

### Action Commands

	actions:    Learn about working with GitHub actions
	run:        View details about workflow runs
	workflow:   View details about GitHub Actions workflows

### Additional Commands

	alias:      Create command shortcuts
	api:        Make an authenticated GitHub API request
	auth:       Login, logout, and refresh your authentication
	completion: Generate shell completion scripts
	config:     Manage configuration for gh

## How to update the github CLI?

When it gives a message like this, it's time to upgrade:

	A new release of gh is available: 2.0.0 → v2.21.1
	https://github.com/cli/cli/releases/tag/v2.21.1

For windows users, upgrade like this:

	winget upgrade --id GitHub.cli

(or, with scoop: `scoop update gh`, or with chocolatey: `choco upgrade gh`)

## Source

- Console output of `gh.exe` itself

## See also

- [.gitignore](gitignore.md)
- [winget](../winget/getting_started.md)
- [VS Code: CodeSpaces / dev containers](../vs_code/devcontainers.md)
