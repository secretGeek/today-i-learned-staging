# git stash: very useful

tl/dr:

	git stash # to store your current uncommited changes
	# then pull/or switch branch
	git stash pop # apply/merge the changes you stashed

Advanced/Common :

	git stash -m "Message to accompany/describe what you are stashing"
	git stash apply   # same as pop (apply the content of the stash) BUT
	                  # also leave it on top of the stash-stack (i.e. not popped)

## Stash is super dooper

It's nice to have clean commits and branches and so on.

One tool that helps with this is `stash`

If you have some changes you are not ready to commit, you can "stash" them aside, using:

	git stash push -u

...the `-u` is to include untracked files. (You may not want to, but I usually do)

Also --- since `push` is the implied subcommand for `git stash` -- you can leave it out... i.e.

	git stash -u

Then you can -- for example -- switch to a branch where you want to apply those changes... or do some other more urgent work...

and when you're in a place where you want those changes back, you can use

	git stash apply

...to bring them back, but *leave* them in the stash.

If you no longer need them at all, and wish to throw them away from the stash, use:

	git stash drop

(You could've used `git stash pop` to apply them *and* remove them from the stash. Up to you.)

Use

	git stash list

To see all your stashes.

If you stash one thing then another, it forms a stack of stashes. Thus the `pop` naming above.

The topmost item is called "stash@{0}" next is "stash@{1}" etc.

To see the item on top of the stack of stashes, in more detail, use:

	git stash show

To see a *specific* item in the stack use:

	git stash show -p "stash@{3}"

...where "{3}" is the item you're looking at.

Or -- more simply use:

	git stash show -p 3

## Avoiding the "Too many revisions specified" error

Note that with [powershell](../powershell/01_summary.md), if you leave out the double-quotes around `stash@{2}`, i.e.

	git stash show -p stash@{2}

...you'll receive the error:

	Too many revisions specified: 'stash@' 'MAA=' 'xml' 'text'

So either include the double quotes, or just use the number alone -- `git stash show -p 2`

## Further reading

- [git-stash](https://git-scm.com/docs/git-stash/1.5.5)
