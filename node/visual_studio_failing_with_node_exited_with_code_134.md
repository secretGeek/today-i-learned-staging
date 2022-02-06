# Visual Studio Build is failing with "node.exe exited with code 134"

Well this was a nasty little rabbit hole.

	"C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Microsoft\VisualStudio\NodeJS\node.exe" exited with code 134

And we found more detail that pointed to `Microsoft.TypeScript.MSBuild.4.1.4/tools/Microsoft.TypeScript.targets` line 551

And on investigation, that part of the `Microsoft.TypeScript.targets` file was concerned with using node to compile typescript.

A team member somehow reasoned that `node.exe` was running out of memory when compiling, so we set the environment variable:

	--max-old-space-size=4071

...and not by specifying it on a command line anywhere, but by literally setting the windows environment variables for that user on that machine.

I expected to see this error again and learn more about getting it to give better clues that let us fix it in a targeted way.