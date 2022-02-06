# Merge pull request via command line

If you do not want to use the merge button (or an automatic merge cannot be performed) you can perform a manual merge on the command line.

Step 1: From your project repository, check out a new branch and test the changes.

    git checkout -b doekman-master master
    git pull https://github.com/doekman/console-adventure.git master

Step 2: Merge the changes and update on GitHub.

    git checkout master
    git merge --no-ff doekman-master
    git push origin master

## resolve merge conflicts arising during pull request

Situation: you're working on a feature branch called `feature-1`

You think you're done - so you push your last commit to the server, to begin a pull request, hoping to merge it to `main`.

Before the Pull request is complete, someone merges a different PR into `main` and azure devops reports there is a merge conflict 'file changed in both'

On your local machine - switch to the feature branch (you are probably already there)

and then...

	git pull origin main

...this will attempt to bring the remote copy of main (`origin main`) into your local repo and folder, where you are working on `feature-1`

The merge conflict will then occur before your eyes, and you can resolve it locally.

When you're done, commit and push (you'll be pushing to `remote feature-1`) and your new commit will form part of the pull request.