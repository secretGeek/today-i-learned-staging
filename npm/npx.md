# npx - a fun and simple npm package runner

Okay -- [npx](https://medium.com/@maybekatz/introducing-npx-an-npm-package-runner-55f7d4bd282b) is a fun idea.

When you install `npm` it also installs a handy little executable called `npx`. What is that for?

I'll explain it by way of an example...

## An example

There's a useful npm package called `http-server` and you can install it globally and then use it to server a folder of html files, like this:

	# install it, globally
	npm install -g http-server
	# run it...
	http-server -o

Two small but persistent problems...

1. a few months later... when you go to use it again... wonder is it up to date? Was there some critical issue that was fixed...
2. On a different machine, go to use it and realise oops, it's not installed... i need to install it first...

Instead -- you can use `npx` to grab it immediately, from the internet, and run it, knowing you're using the latest version, and it won't be installed at all.


	npx http-server -o


So npx is like renting instead of buying. Use it, thow it away. Next time, use the latest again... then throw it away. No commitment.


## Local scripts

The other great thing is inside projects... you want each project to be able to talk about the local scripts it uses, without it requiring that you install them globally and worrying about version collisions on those globally installed projects. Previously this meant you had to use `npm run-script` to use a locally installed version. But -- on top of what is stated above -- `npx` will first check for a locally installed version, inside the project you are tinkering in.