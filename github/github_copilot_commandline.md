# Github copilot on the commandline



	> npm install -g @github/copilot

	added 7 packages in 19s
	npm notice
	npm notice New minor version of npm available! 11.6.1 -> 11.12.1
	npm notice Changelog: https://github.com/npm/cli/releases/tag/v11.12.1
	npm notice To update run: npm install -g npm@11.12.1
	npm notice



Alternatively --

	winget install GitHub.Copilot




## Adding instructions to a project


> No copilot instructions found. Run /init to generate a copilot-instructions.md file for this project.


Google tells me this...

> You can chat, ask for code overviews, or switch to Plan Mode (Shift + Tab) to have Copilot build a multi-step execution plan before writing code.

Though google is a lying swine, so I'll wait and see.


The first thing you're confronted with is:

> "Confirm folder trust"
>
> Copilot may read files in this folder. Reading untrusted files may lead Copilot to behave in unexpected ways. With your permission, Copilot may execute code
> or bash commands in this folder. Executing untrusted code is unsafe.
>
> Do you trust the files in this folder?
>
>  % 1. Yes
>    2. Yes, and remember this folder for future sessions
>    3. No (Esc)


And it's weird. I would've thought that I'd be choosing to give copilot access to the folder, "do I trust copilot to access my precious files?" -- but that's not it at all. Copilot already has access to *everything*. It's on your system now.

Copilot is not worried that copilot might fuck up all your shit. Whatevs. Copilot is worried that there might be a file there, a dirty "untrusted" file, which contains "prompt injection" stuff, that makes copilot do things... and leads to unexpected results, such as bad publicity for copilot.



> Set up terminal for multi-line input support
> Detected terminal Windows Terminal which supports multi-line input by setting up a key binding for shift+enter.
>
> Would you like to add this key binding to your terminal configuration?
>
> > 1. Yes
>   2. No (Esc)




> 💡 No copilot instructions found. Run /init to generate a copilot-instructions.md file for this project.



> Use @ to reference specific files or directories in your prompts.



Instead of being immersed in copilot commandline, you can run one off commands like:

	copilot -p "Explain this file: ./main.ts"

(The parameter `-p` is `--prompt`)


Use "/" to see all available commands.

