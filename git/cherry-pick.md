# Cherry-pick some commits from one branch to another

This is pretty easy. Many of the guides online talk about using particular tools, so i just want to write down the technique used for the commandline.

First -- find the *full* SHA of the commits you want to cherry-pick.

If they are commits that have been merged into another branch -- then make sure to grab the original commit, not the merge commit. (if you grab the merge commit's SHA -- you'll end up with an error message that is pretty clear about the issue, so it's quite a recoverable error anyway)

The full `SHA` is quite long, eg. `5f8c11b8f5ca131fdc00776ac428cc9b0a90ee19`

To cherry-pick that commit into the current branch:

	git cherry-pick -x 5f8c11b8f5ca131fdc00776ac428cc9b0a90ee19

The `-x` is optional, but if included it will get the commit message of the original commit, and append this to it:

	(cherry picked from commit 5f8c11b8f5ca131fdc00776ac428cc9b0a90ee19)

... which I think is a nice and classy touch!

## Cherry Pick for a hot fix

When creating a cherry pick for a hot-fix to main -- you probably want to follow this slightly more involved process, so that it becomes a pull request, not just a direct commit to main.

1. switch to the main branch, if you're not there already:

		git checkout main

2. create a new branch

		git checkout -b my-new-branch-name
		git push -u origin my-new-branch-name

3. cherry pick the commits you like into your new branch, e.g.:

		git cherry-pick -x 5f8c11b8f5ca131fdc00776ac428cc9b0a90ee19
		git cherry-pick -x b5728539028366e98a57855514549ad7e0776458

4. (Optional) Look at your local outgoing commits to make sure you're about to push what you want to push....

		git log --branches --not --remotes=origin

5. Push to the remote -- so you can create a pull-request (PR) from there

		git push

6. (Optional...) switch back to `main` I guess...

		git checkout main

## See also

- [Branching in git](branch.md)
- [Merge a branch to main](merge_branch_to_main.md)
