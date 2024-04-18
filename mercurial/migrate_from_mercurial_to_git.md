# Migrate from Mercurial to git

## Suggested approach (but not for windows)

I read about this process -- but it doesn't look windows friendly.

- https://git-scm.com/book/en/v2/Git-and-Other-Systems-Migrating-to-Git#_mercurial

I have a note here that says "Note: final line had to change to be a `--force`" -- but maybe I was migrating something from subversion to git... because I definitely did not use it for hg to git.

So here's a better alternative...

## Use hg-git extension

Try the process outlined here [Mark Heath](https://markheath.net/post/how-to-convert-mercurial-repository-to)

### Get the hg-git extension

Install hg-git via [pip](../python/pip.md) -- from an elevated console:

	pip install mercurial
	pip install hg-git



Enable it in your `mercurial.ini` file

	[extensions]
	hggit =

To see if it is now available, type `hg help extensions` and it should be listed under "enabled extensions" like so:

```plaintext
enabled extensions:
	...
	hggit         push and pull from a Git server
	...
```

Also -- this should return some help for it...

	hg help hggit

says:

	hggit extension - push and pull from a Git server

	This extension lets you communicate (push and pull) with a Git server... etc.



## Write down the source and the target

There will be two things that matter here.

- source -- the source hg repo
- target -- the target git repo

## create target repo

Create your target repo, let's call it `git_repo` for the purpose of this exercise - but you call it something useful!

What we'll be creating is a bare repo -- so I recommend putting it in a folder called "bare_repos", as you'll want non-bare versions later too!

	git init --bare git_repo

(A bare repo is pretty much just the content that would normally be in the ".git" subfolder, without a local copy of the files at all)

## prepare the source

Go to the source repo and run:

	hg bookmarks hg

I found this wasn't enough, and that later the bare repo would be bad, as when I ran a `git log` it would return:

> fatal: your current branch 'master' does not have any commits yet

(which also reminds me I want to create a 'main' instead of 'master', which any old instructions do not cover!)

I had to also run:

	hg bookmark -r default master

(Note: try instead performing... `hg bookmark -r default main`)

## push from source to target

	hg push path\to\git_repo

Now got to the bare repo and see if `git log` shows you the expected history.

## make a non-bare version somewhere nearby

	git clone git_bare_repo git_regular_repo

... see that the log is correct:

	git log

## Compare your new repo to your old repo, at file level

How do they compare?

Some differences I've seen, when comparing via `sgdm.exe`

- Some files in my mercurial repo have linux style line endings (`\n`) while git converted these to all have windows style line endings (`\r\n`).
- Any `.hgignore`d files were not brought across. There are two things I need to do here:
	1. Setup a `.gitignore` that is suitable for the project
	2. Some files ought to be ignored but also manually copied across. For example `*proj.user` files from visual studio.

This is also a good time to build/compile/lint/test your solution locally and ensure that everything it needs is present.

While doing that it may update/regenerate files - and this will give you a chance to see:

1. are you failing to ignore any files you should ignore?
2. are there any files being tracked that are built artefacts which you would rather not track?

To stop tracking an item that you do not wish to track (see [Remove a file from git but keep the local file](../git/remove_from_git_but_keep_locally.md#quick-version))

1. Make sure the `.gitignore` is ignoring the file
2. Run: `git rm --cached path/to/file/to/stop/tracking.dll`
3. Verify that the file still exists locally, but git sees it as removed:

		git stat                              # git thinks file is deleted?
		dir path/to/file/to/stop/tracking.dll # file still exists on disk?

4. Commit your work with `git commit -a -m "removed a generated file we don't need to track"`

## Import your new repo into github

(I assume, without any proof, that you also want to move your work into github, or another cloud git provider)

(I assume, without proof, that you have a user account on github)

Create a new repo on github, but do not give it a README or a .gitignore or a license. (i.e. ==it should have Zero commits==)

Maybe make it private. *I think you should.*

Find the url for the new repo, e.g. `https://github.com/example-user/my-repo`

## Make a "bare" copy of your local repo

	mcd bare-2
	git clone --bare ..\my-repo\

Check that it is ok... (note it has an extra .git on the end... that's ok!)

	cd my-repo.git
	git log

...Inspect the log. Your history is as expected.

Push it to github, using the "mirror" option like so:

	git push --mirror https://github.com/example-user/my-repo.git

Note the `.git` on the end. And the reason we say "my-repo" is because that's the name of the repo at github, not because it's the local repo name. (I assume, without proof, we *could* do a rename of the repo as part of this step, if we wanted)

## Now clone it locally one last time

I keep my github repos in a specific place and have `markjump` locations to help get there, and a .ok file setup to help with it, etc.

-- and bring into it any special local-only files it needs.

Run smoke tests, local builds, test suite etc.

## Source

[9.2 Git and Other Systems - Migrating to Git -- from Mercurial](https://git-scm.com/book/en/v2/Git-and-Other-Systems-Migrating-to-Git#_mercurial)

## See also

- [Writing Your First Mercurial Extension](https://secretgeek.net/mercurial_extensions)
- [Convert a mercurial repo to git](convert_hg_to_git.md) - for trickier situations where you have multiple open branches to migrate
- [Remove a file from git but keep the local file](../git/remove_from_git_but_keep_locally.md#quick-version)
