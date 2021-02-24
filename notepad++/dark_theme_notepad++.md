# Dark Theme in Notepad++

You can set a dark theme for the editing experience itself using `Settings > Style Configurator > Select Theme > Zenburn`

On windows, this theme is stored in:

	%appdata%\Notepad++\themes\Zenburn.xml

Here is an alternative:

- [Dracula Theme](https://draculatheme.com/notepad-plus-plus/)

Download `dracula.xml` from there and then....

- Go to `$env:AppData\Notepad++\themes`
- Place `Dracula.xml` inside that folder
- Restart `Notepad++`
- Dracula will be available in `Settings > Style Configurator`

## Markdown files will now look terrible

(Background will be dark, apart from text where words will have light background. Current line has black background and dark gray text.... almost unreadable)

Install better [markdown support in notepad++](markdown_in_notepad.md), that supports the zenburn theme!

## The application itself does not support dark theme

Note that the menu system and the chrome of `NotePad++` is not affected by those themes.

Ideally, setting windows to Dark mode should be enough, but Notepad++ does not support responding to that theme. (It does respond to high-contrast settings, but these are quite different.)

There is a community discussion inviting you to submit the code changes yourself: [Make Notepad++ dark (not editor theme, but editor itself)](https://community.notepad-plus-plus.org/topic/17829/make-notepad-dark-not-editor-theme-but-editor-itself)

> You are welcome to submit the needed code changes implementing this feature.

## See also

* [Markdown in Notepad++](markdown_in_notepad.md)