# Getting started with electron

What is it?

> Electron enables you to create desktop applications with pure JavaScript by providing a runtime with rich native (operating system) APIs. You could see it as a variant of the Node.js runtime that is focused on desktop applications instead of web servers.

Okay -- I installed yarn instead (see [install yarn on windows](../yarn/install-yarn-on-windows-2020.md)

	yarn init

Tell it things.

	yarn install electron

Okay - that worked better.

Edited `package.json` and:

- replace `index.js` with `main.js`
- add a start action...
- leave out a comma (this was by accident)

So `package.json` now says:

	{
		"name": "my app",
		"version": "1.0.0",
		"description": "my app in electron",
		"main": "main.js",
		"author": "NimbleThing.net",
		"license": "None currently. All rights reserved."
		"scripts": {
			"start": "electron ."
		}
	}

...which lead to this error...

	> yarn install --save-dev electron
	yarn install v1.22.5
	error An unexpected error occurred: "C:\\users\\MyLeon\\dropbox\\secretgeek\\scratch\\electron\\nimbletext\\package.json: Unexpected string in JSON at position 196".

Stupid that it says the missing comma issue is so ridiculously user hostile:

	Unexpected string in JSON at position 196".

Fixed that -- now complains:

	License should be a valid SPDX license expression

Also said....

	error `install` has been replaced with `add` to add new dependencies. Run "yarn add electron --dev" instead.

So I change the license to:

	"license": "UNLICENSED",

And now to run:

	yarn add electron --dev

Done in 7.46s. That's nice.

Now added a `main.js` and a `index.html` based on the tutorial i'm following -- this one.

	// Open the DevTools.
	win.webContents.openDevTools()

`^` I like that.

I don't like this warning:

	webFrame.executeJavaScript was called without worldSafeExecuteJavaScript enabled. This is considered unsafe. worldSafeExecuteJavaScript will be enabled by default in Electron 12.

Ok fun.

Now trying this other approach....

	git clone https://github.com/electron/electron-quick-start.git
	cd electron-quick-start
	yarn install
	yarn start

Okay -- nifty demo it has menus.

And it doesn't have that warning... Let me check something....

Okay I copied over the line from the erroring project to the working project, the line that says....

	We are using node <script>document.write(process.versions.node)</script>,
	Chrome <script>document.write(process.versions.chrome)</script>,
	and Electron <script>document.write(process.versions.electron)</script>.

...and now that failed to run *and* I got this massive error message....

> Refused to execute inline script because it violates the following Content Security Policy directive: "default-src 'self' script-src 'self'". Either the 'unsafe-inline' keyword, a hash ('sha256-I/aHv1UwJJBBNPzXh7y8431zWAJCeFzsD1fvSu1KqMw='), or a nonce ('nonce-...') is required to enable inline execution. Note also that 'script-src' was not explicitly set, so 'default-src' is used as a fallback.

See https://www.electronjs.org/docs/tutorial/boilerplates-and-clis

## Source

- [electron first app](https://www.electronjs.org/docs/tutorial/first-app)

	/EOF

## Everything after here is a historical note

Getting started is as easy as:

1. Create a package for the application you wish to build.

In a new folder run `npm init`

It may just have place holder names and address for now.

Infact it should.

Idea: When you initiate a project, you should not write actual strings into the name of the program and the location - just guids.

Idea: A separate navigation tool can be used, and it lets you rename these things as you go.

Add a start script to `index.js`

	{
		"name": "your-app",
		"version": "0.1.0",
		"main": "main.js",
		"scripts": {
			"start": "electron ."
		}
	}

For now if you run `npm start` you'll receive something like:

	> npm start
	npm ERR! missing script: start

	npm ERR! A complete log of this run can be found in:
	npm ERR!     C:\Users\MyUser\AppData\Roaming\npm-cache\_logs\2020-09-22T05_33_56_124Z-debug.log

(As always I find npm useless on my windows machine)

## Install Electron

Now:

	npm install --save-dev electron

This goes horribly because `npm` is useless on my machine.

## Historical Note

Previous Version of this file read:

Get started is as easy as:

	# Clone the Quick Start repository
	> git clone https://github.com/atom/electron-quick-start

	# Go into the repository
	> cd electron-quick-start

	# Install the dependencies and run
	> npm install; npm start

(This assumes you have [git](../git/01_summary.md) and [npm](../npm/01_summary.md).)

Next, read the quick start tutorial...

 - http://electron.atom.io/docs/latest/tutorial/quick-start/

`todo` Wanted, examples of electron apps doing the following:

 - [creating a menu](https://github.com/atom/electron/blob/master/docs/api/menu.md)
 - [saving to local file system](save_to_file.md)
 - [reading from local file system](save_to_file.md)
 - self-updating
 - crash reporting
 - calling a webservice (of any sort at all)
 - obfuscation/IP protection.
 - save/load "settings" (other than explicitly using dialogs)

## Source

 - http://electron.atom.io/#get-started
 - http://electron.atom.io/docs/latest/tutorial/quick-start/

Please watch this 9 min video. https://m.youtube.com/watch?v=ojX5yz35v4M

**end of historical note**
