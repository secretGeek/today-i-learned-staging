# Checkout specific revision

You want to go back to a specific revision... First find the revision#, either the full hash or the short hash, or the tag name.

Then you want to 'describe' that revision...

	git describe e908c80cc

...which will output a fuller name, e.g. `build-3.0.7468-dev-883-ge908c80cc`

Then simply `git checkout {thatName}` e.g.

	git checkout build-3.0.7468-dev-883-ge908c80cc

...and you'll be greeted with a lengthy message like this:

	Note: switching to 'build-3.0.7468-dev-883-ge908c80cc'.

	You are in 'detached HEAD' state. You can look around, make experimental
	changes and commit them, and you can discard any commits you make in this
	state without impacting any branches by switching back to a branch.

	If you want to create a new branch to retain commits you create, you may
	do so (now or later) by using -c with the switch command. Example:

	  git switch -c <new-branch-name>

	Or undo this operation with:

	  git switch -

	Turn off this advice by setting config variable advice.detachedHead to false

	HEAD is now at e908c80cc Merged PR 12345: laser targeting systems no longer mistake cats for dogs (sorry mr whiskers, r.i.p.)

## Source(s)

- [Checkout a specific revision with Git - SysGears](https://sysgears.com/notes/checkout-a-specific-revision-with-git/)

## See also

- [Cherry-pick some commits from one branch to another](cherry-pick.md)