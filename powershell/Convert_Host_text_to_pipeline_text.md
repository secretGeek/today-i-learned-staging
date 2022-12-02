# Convert Text Output into Pipeline Output

This is a hard problem to google for, and a hard problem to describe -- but when you have it, you know it.

With command line tools from "other platforms", such as tools that originated on linux, and tools like node/npm/npx, and ruby cli tools -- it can be hard to process their output with powershell, because they are outputting text and errors and warnings, but not "objects" like powershell expects.

To get the output, of all kinds, and put it into the standard stream, use a stream modifier set like this:

   6>&1 5>&1 4>&1 3>&1 2>&1

For example, to capture *everything* from this `npx` command and pipe it to the `out-file` cmdlet, I used this command:

   npx jest "myjestfile.test.tsx" --runInBand 2>&1 | out-file "c:\apps\jest\myjestfile.test.tsx.txt" -encoding utf8

What do the numbers 1 and 2 refer to here?

0,1 and 2 are standard file descriptors --

- 0 is standard input
- 1 is standard output
- 2 is standard error


I've also seen larger numbers, over 2, treated in the same way:

	npx jest "myjestfile.test.tsx" --runInBand 6>&1 5>&1 4>&1 3>&1 2>&1 | out-file "c:\apps\jest\myjestfile.test.tsx.txt" -encoding utf8


Any numbers over 2 are "other" file descriptors created by the process being run (`npx` in this example) -- though that seems to either have no effect, or risk a bad effect.

Next problem -- powershell expects standard error to consist of exception objects, so what's likely to end up in your file is that any out put from standard error (file descriptor 2) would be like this:

	+ npx jest "myjestfile.test.tsx" --runInBand 6>&1 5>&1 4>&1 3>&1 2>&1 | o ...
	+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		+ CategoryInfo          : NotSpecified: (PASS ./myjestfile.test.tsx (51.522 s):String) [], RemoteException
		+ FullyQualifiedErrorId : NativeCommandError

...to get around that, convert the pipe into strings along the way... with `% { "$_" } | `

   npx jest "myjestfile.test.tsx" --runInBand 2>&1 | %{ "$_" } | out-file "c:\apps\jest\myjestfile.test.tsx.txt" -encoding utf8

## Source

- [Stack Overflow: Error when calling 3rd party executable from Powershell when using an IDE](https://stackoverflow.com/questions/2095088/error-when-calling-3rd-party-executable-from-powershell-when-using-an-ide)

## See also

- [Install node on windows subsystem for linux / ubuntu](../node/install_node_on_ubuntu_wsl.md)
