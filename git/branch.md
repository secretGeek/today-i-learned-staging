# Branching in git

## Create a new branch

if: You've started to do some work but haven't committed anything yet.
(or: you're about to start some work) and decide you'd like it to go to a new branch:

It's as easy as this...

	git checkout -b my-new-branch-name

The output you hopefully see is:

> Switched to a new branch 'my-new-branch-name'

## Tell the origin about it

Now inform the origin about this new branch....

	git push -u origin my-new-branch-name

## A quick warning about mixed case

I have had problems before if I create a branch with mixed-case (because windows/powershell is not case sensitive, but linux/linus/git *are* very sensitive about these things.) Hence:

**I strongly recommend using all lower-case in your branch names**

## Sources

- [How To Create A GIT Branch With Your Current Changes](https://medium.com/@EeKayOnline/how-to-create-a-git-branch-with-your-current-changes-a79b297c339e)

## See also

- [Delete old branches](delete_old_branches.md)
- [Compare branches](compare_branches.md)
- [Merge a branch to main](merge_branch_to_main.md)
- [Cherry-pick some commits from one branch to another](cherry-pick.md)