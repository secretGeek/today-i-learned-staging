# Adding more files/changes to a commit you've just done

Assuming you haven't done more commits or pushed... you can "amend" a commit to add more to it.

Just add the files/changes you missed or changed...

	git add the_left_out_file

And then:

	git commit --amend --no-edit

## Source

- [SO: 40503417](https://stackoverflow.com/questions/40503417/how-to-add-a-file-to-the-last-commit-in-git) - and a million other places.


## See also

- [change commit message (before you've pushed)](change_commit_message.md)