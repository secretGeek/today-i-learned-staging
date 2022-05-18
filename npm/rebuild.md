## NPM can't find local packages

Ever had a situation where npm can't run local packages? 

For example `npm run tests` is failing because the first thing it does it `jest` and node can't find `jest`?

It could be that you haven't installed the packages, if so, used `npm install` to do that... but I think you know about `npm install` and it's probably *not* that.

What I found recently was that the folder `node_modules/.bin` was pretty much empty. What it *should* have had was a whole lot of files, three files for each command that can be run, e.g.

	webpack
	webpack.cmd
	webpack.ps1

...and in a typical `node_modules/.bin` folder for a "real" project, there might be 160 files (for example). But in my project, it had only 3 such files...

How did this happen?

I'm not sure, but I suspect it was because I was urged to run a command "& npm rebuild node-sass"

Generally if `node_modules` isn't behaving I run `npm i` (full name, "npm install") and get things back in shape. In this case, it wasn't enough.

A good next step would be: delete the package-lock file, and then run `npm i` -- i didn't do this, but suspect it would've helped. (I skipped this step, today)

The *next* fall back is: delete the entire `node_modules` folder, and then run `npm i` -- this was enough to help me in this case.
