# Node Version Manager - nvm

`nvm` lets you have multiple side by side versions of node on your machine, and switch between which one is used at any point in time.

> `tip` Note that `NVM for windows` is not the other more famous `nvm`, so when searching for help or information, or hearing about nvm's features... much of it does not apply to `nvm for windows`. 🥹
>
> `tip` Note also: `NVM for Windows` requires an elevated console.



Once nvm is installed:

## See what versions you have

To see what versions of node you currently have:

    nvm list

There will be an asterisk before the name of the version you are currently using (if any).

You can also use `nvm current` to see just the version of node you are currently using.


## Switch to a particular version

To switch to a particular version, use `nvm use` **from an elevated prompt** e.g.

    nvm use 12.13.1

You can then verify the current version with `nvm list` if you wish, or with `nvm current`.

## See what versions are available to install

	nvm list available

...or visit <https://nodejs.org/en/download/releases>

## Install a specific version of node (often an old version)

To install the specific version of node you need, use `nvm install` followed by the version number, e.g.

	nvm install 10.22.0

That does *not* mean it is the current version. To switch to it, use `nvm use 10.22.0` (as described above)


## See also

- [Volta - node version manager](volta.md) (includes a comparison with nvm)