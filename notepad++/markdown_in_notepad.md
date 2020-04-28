# Markdown in Notepad++

To improve markdown styling in notepad++ (particularly if [using a dark theme in notepad++](dark_theme_notepad++.md) like `ZenBurn`, where it goes really bad....

Use [Edditoria markdown++ syntax highlighting](https://github.com/Edditoria/markdown-plus-plus)

	:: Check whether you have Node.js installed
	node -v

	:: Go to UDL folder of Notepad++
	cd $env:AppData\Notepad++\userDefineLangs

	:: Example: Download Zenburn UDL file
	npx markdown-plus-plus zenburn

	:: Read help for details
	npx markdown-plus-plus --help


Relies on [npm](../npm/getting_started.md)


You may need to restart notepad -- and close and reopen relevant files, before notepad++ will apply the correct user defined language to them.


## Real time previews....


> MarkdownViewer++ is a Notepad++ plugin that lets you type a file using Markdown and see the preview in real time, in a preview panel

See [github nea markdownviewer++](https://github.com/nea/MarkdownViewerPlusPlus)

Download the 32 or 64 bit (check what you have in `? > about`

Unzip the dll and copy it to your `plugins` folder (open it with `Plugins > Open plugins folder...`)

May need to restart notepad++.

You can set custom CSS. It seems to be internet explorer browser, so CSS support is quite old.


## See also

* [dark theme notepad++](.\dark_theme_notepadplusplus.md)
* [How to use Markdown in Notepad++](https://superuser.com/questions/586177/how-to-use-markdown-in-notepad)

