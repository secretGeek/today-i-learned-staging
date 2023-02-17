# File Too Large I Want to Remove It


Ah -- at some point I've added a large file to my local copy of a repository.

It only becomes a problem when I try to push to the server...

	> git push
	Enumerating objects: 210, done.
	Counting objects: 100% (210/210), done.
	Delta compression using up to 8 threads
	Compressing objects: 100% (183/183), done.
	Writing objects: 100% (197/197), 12.72 MiB | 731.00 KiB/s, done.
	Total 197 (delta 33), reused 0 (delta 0), pack-reused 0
	remote: Resolving deltas: 100% (33/33), completed with 8 local objects.
	remote: error: Trace: aaaaaaaaaaaaaaaabbbbbbbbbbbbbbcccccccccccccccccccdddddddddd
	remote: error: See http://git.io/iEPt8g for more information.
	remote: error: File myrepo/myfolder/BIGFILE.rpt is 641.12 MB; this exceeds GitHub's file size limit of 100.00 MB
	remote: error: GH001: Large files detected. You may want to try Git Large File Storage - https://git-lfs.github.com.
	To https://github.com/myaccount/myrepo.git
	 ! [remote rejected] master -> master (pre-receive hook declined)
	error: failed to push some refs to 'https://github.com/myaccount/myrepo.git'


You've already committed the file... you have to edit history -- you can't simply "add" a "remove" like so...


	git rm BIGFILE.rpt
	git commit -m "deleting the BIG file!"


If it was added in the most recent commit -- 

	git rm --cached myfolder/BIGFILE.rpt
	git commit --amend -C HEAD


Otherwise -- FIND the commit where it was added....

(How to find the commit where a file was added...)


	git log --diff-filter=A -- myfolder/BIGFILE.rpt


returns....


	commit ffffffffccccccaaaaabbbbbaaaa
	Author: Author Name <Author@Example.com>
	Date:   Mon Feb 6 14:52:11 2023 +1000
	
	Adding that big file

...And you need to find the commit before that one... the last 'good' commit....

e.g. it might be -- 
	
	c067fde7f3baf86f23ec32a48cae87eaa3a895c2


Now you run a rebase back to there...
	
	git rebase -i c067fde7f3baf86f23ec32a48cae87eaa3a895c2


And that will show the list of commits to edit or pick... put "edit" next to the commit in which any big file was added. 

THen use `git rm folder/BIGFILE.rpt` alternated with `git status` (and, as it suggests, `git rebase --continue`) ... until you have removed the large file (or files) along the way, and rebased your way right back to the place where you wanted to end up.

Then try and `git push`... and perhaps you'll learn about other big files you missed, dammit! You'll get there eventually.


## source

- [Tutorial: Removing Large Files from Git](https://medium.com/analytics-vidhya/tutorial-removing-large-files-from-git-78dbf4cf83a/)
- [Find the commit where a file was added](https://stackoverflow.com/questions/11533199/how-to-find-the-commit-in-which-a-given-file-was-added)

