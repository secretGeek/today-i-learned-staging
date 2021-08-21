# Notepad++ command line help

Note I can scroll to a particular line using:

	> n -n56 .\yow.txt

...or to a particular position...

	> n -n4321 .\yow.txt

...and could first find that position by using a different regex based match finder.

That's the plan!

	---------------------------
	Notepad++ Command Argument Help
	---------------------------
	Usage :

	notepad++ [--help] [-multiInst] [-noPlugin] [-lLanguage] [-LlangCode] [-nLineNumber] [-cColumnNumber] [-pPosition] [-xLeftPos] [-yTopPos] [-nosession] [-notabbar] [-ro] [-systemtray] [-loadingTime] [-alwaysOnTop] [-openSession] [-r] [-qnEasterEggName | -qtText | -qfCntentFileName] [-qSpeed1|2|3] [-quickPrint] [-openFoldersAsWorkspace] [filePath]

	--help : This help message
	-multiInst : Launch another Notepad++ instance
	-noPlugin : Launch Notepad++ without loading any plugin
	-l : Open file or display ghost typing with syntax highlighting of choice
	-L : Apply indicated localization, langCode is browser language code
	-n : Scroll to indicated line on filePath
	-c : Scroll to indicated column on filePath
	-p : Scroll to indicated position on filePath
	-x : Move Notepad++ to indicated left side position on the screen
	-y : Move Notepad++ to indicated top position on the screen
	-nosession : Launch Notepad++ without previous session
	-notabbar : Launch Notepad++ without tabbar
	-ro : Make the filePath read only
	-systemtray : Launch Notepad++ directly in system tray
	-loadingTime : Display Notepad++ loading time
	-alwaysOnTop : Make Notepad++ always on top
	-openSession : Open a session. filePath must be a session file
	-r : Open files recursively. This argument will be ignored
			 if filePath contain no wildcard character
	-qn : Launch ghost typing to display easter egg via its name
	-qt : Launch ghost typing to display a text via the given text
	-qf : Launch ghost typing to display a file content via the file path
	-qSpeed : Ghost typing speed. Value from 1 to 3 for slow, fast and fastest
	-quickPrint : Print the file given as argument then quit Notepad++
	-openFoldersAsWorkspace: open filePath of folder(s) as workspace
	filePath : file or folder name to open (absolute or relative path name)
