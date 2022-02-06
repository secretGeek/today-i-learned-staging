# Remove a file from git but keep the local file

First: to make sure you don't add it, commit it or push it in future -- **add it to your .gitignore file**.

if you haven't added it, committed it or pushed it... do nothing (you added it to .gitignore above right?)

if you've added it, but haven't committed it or pushed it... (you've since added it to .gitignore above right?)

	git reset {someFile}

if you added it, committed it, maybe even pushed it... (you've since added it to .gitignore above right?)

- for a file:

		git rm --cached {someFile}

- for a directory

		git rm --cached -r {someDir}

This assumes the file doesn't contain sensitive stuff.

==If it contains sensitive stuff, and you've already committed it, then research the right approach, polish your resume etc.==

## Quick version

To stop tracking an item that you do not wish to track:

1. Make sure the `.gitignore` is ignoring the file
2. Run: `git rm --cached path/to/file/to/stop/tracking.dll`
3. Verify that the file still exists locally, but git sees it as removed:
		git stat # git thinks the file is deleted?
		dir path/to/file/to/stop/tracking.dll # file is still there?
4. Commit your work with `git commit -a -m "removed a generated file we don't need to track"`

## Source

- http://stackoverflow.com/questions/3469741/remove-file-from-the-repository-but-keep-it-locally
- http://stackoverflow.com/questions/1143796/remove-a-file-from-a-git-repository-without-deleting-it-from-the-local-filesyste

## See also

- [Migrate from Mercurial to git](../mercurial/migrate_from_mercurial_to_git.md)