# Git: how do i revert a single file

## Revert changes to a file if you haven't staged it...

To revert changes to 1 file and just make it the same as the head....

	git checkout -- path/to/your/file


## To unstage a file

And if a file is staged -- unstage it with

	git restore path/to/file


## Revert all local changes

You've made a total mess of the local state... and just want things as they were before you messed with the most recent commit....

The infamous `git reset --hard`

    git reset --hard

That will, however, leave any newly created files, and any edits to unstaged files.

Clean those with:

	git clean -fxd

...where `-fxd` is a combination of `-f` for "force" (`--force`), `-x` for "don't use standard ignore rules" and `-d` for "recurse into untracked directories too"

`tip` -- Consider all adding `-n` for `--dry-run` if you're not sure what `git clean -fxd` is about to do!


