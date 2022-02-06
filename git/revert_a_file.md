# Git: how do i revert a single file


To revert changes and just make it the same as the head....

	git checkout -- path/to/your/file



And if a file is staged -- unstage it with

	git restore path/to/file