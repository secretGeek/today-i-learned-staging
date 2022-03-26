# Get Powershell Formatting in VS Code if it has stopped working

All of the guidelines tell you to just install the "Powershell" Extension (from Microsoft) into VS Code, and then you can format Powershell code using "Format Document" in the command-palette (avaialble via "ctrl shift p") -- of by pressing "shift alt x".

But then other people are saying no the Powershell extension no longer has a formatter. I almost became one of these people. But what I worked out is that the Powershell extension does have a formatter for Powershell, just that it wasn't "hooked up" in the settings.

In your settings file, i.e. in:

	%appdata%\Code\User\settings.json
	
...or in powershell friendly syntax:

	$env:appdata\Code\User\settings.json

...or as a literal file path, something like:

	C:\Users\YourUserName\AppData\Roaming\Code\User\settings.json`

You need to add some configuration for how the "powershell" language is treated, in particular which `defaultFormatter` to use:

    "[powershell]": {
        "editor.defaultFormatter": "ms-vscode.powershell"
    },

You tell it to use the VS Code extension, from Microsoft. It *can* do the formatting. It just needs to be told to do so. If VS Code forgot.

