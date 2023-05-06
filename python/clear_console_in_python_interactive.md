# How to clear the console in python interactive

	def cls(): print("\033[H\033[J", end="")

And then --

	cls()
	
Description, from [stackoverflow answer](https://stackoverflow.com/a/50560686/49) --


- `\033` stands for `ESC` (ANSI value 27).
- `\033[` is a special escape sequence called Control Sequence Introducer (`CSI`).
- `\033[H` command moves the cursor to the top left corner of the screen.
- `\033[J` clears the screen from the cursor to the end of the screen.


## Sources

- [Stackoverflow: How to clear the interpreter console?](https://stackoverflow.com/questions/517970/how-to-clear-the-interpreter-console)