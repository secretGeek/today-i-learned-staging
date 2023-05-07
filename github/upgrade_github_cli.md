# Upgrade `gh.exe` -- the github CLI

One ghastly day you'll see a message like this:

	A new release of gh is available: 2.21.1 → 2.27.0
	https://github.com/cli/cli/releases/tag/v2.27.0

How do you upgrade?


## Upgrade on Windows

For Winget:

	winget upgrade --id GitHub.cli

For Scoop:

	scoop update gh

For Chocolatey:

	choco upgrade gh

## See also

- [Github cli](github_cli.md) -- more about the github CLI including these contents:
  - Install with winget
  - Upgrade with winget
  - Once only: Authorize the app
  - General usage
  - Core Commands
  - Additional Commands
  - Create new repo
  - Gather a list of all my issues
    - First write a list of all my repos into a single file
    - Use that list to get my full list of issues
  - External references
  - See also

- [Getting Started with Winget](../winget/getting_started.md) -- very useful if WinGet is your thing.

