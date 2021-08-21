# npm cant find file to rename delete

npm fails while trying to delete or rename a file during an `npm install` with a message of

> This is related to npm not being able to find a file.

Things that might work...

- Try running `npm install` more than once. 🤦
- Try deleting the `node_modules` folder. It might help. It might not.
- Try using `yarn` instead. This has been my solution in the past.

But the best solution for me seems to be:

	npm cache clean -f

To completely clear whatever

## Full text of error:

	npm ERR! code ENOENT
	npm ERR! syscall rename
	npm ERR! path C:\temp\scratch\vite\hello-vite-world\node_modules\function-bind
	npm ERR! dest C:\temp\scratch\vite\hello-vite-world\node_modules\.function-bind.DELETE
	npm ERR! errno -4058
	npm ERR! enoent ENOENT: no such file or directory, rename 'C:\temp\scratch\vite\hello-vite-world\node_modules\function-bind' -> 'C:\temp\scratch\vite\hello-vite-world\node_modules\.function-bind.DELETE'
	npm ERR! enoent This is related to npm not being able to find a file.
	npm ERR! enoent

## Source(s)

- [What could cause an error related to npm not being able to find a file? No contents in my node_modules subfolder. Why is that?](https://stackoverflow.com/questions/49415958/what-could-cause-an-error-related-to-npm-not-being-able-to-find-a-file-no-conte)

## See also

- [npm cant find file to rename delete](../npm/npm_cant_find_file_to_rename_delete.md)
