# Install yarn on windows 2020

Tired of errors from `npm`, i now want errors from `yarn` too.

## Pre-Requisite: node

(Check your version: `node -v`)

I have version `14.4.0`

Install if needed, or upgrade. (TODO: Link to node install/upgrade)

(`Get-Command node` tells me node is here: `C:\Program Files\nodejs\node.exe`)

(Some say to upgrade node with `nvm` but that is for linux/apple only. `nvmw` is a different and now outof date attempt for windows. this one is newer: <https://github.com/coreybutler/nvm-windows> maybe it will work.)

(i found i had it in chocolatey. upgrade node with with `cup nodejs`

Install yarn with chocolatey....

From admin window:

	choco install yarn


Ah... I think that worked.


	yarn --version


## Common yarn commands


Start a package
	
	yarn init


Install what needs installing

	yarn 
	yarn install
	
	
Add a package (pick a technique..)
	yarn add [package]
	yarn add [package]@[version]
	yarn add [package]@[tag]