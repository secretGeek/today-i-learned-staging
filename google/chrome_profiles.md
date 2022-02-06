# How to get the most out of chrome profiles

If you have more than one microsoft account (for example) then you need multiple chrome profiles to be able to access them both at once.

You can open a new profile, "pin" it to your task bar, and treat it as a whole separate persona.

If you inspect that profile shortcut's "properties", you'll find the Target is something like this:

  "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --profile-directory="Profile 3"

The important bit there is "Profile 3"

After a while though, your "original" chrome icon might assume you want to use one of the other profiles.

So change your original chrome shortcut to have this Target:

	"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --profile-directory="Default"

And if you want to link to any other profiles: after this, they are named like this:

	"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --profile-directory="Profile 1"

or this

	"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --profile-directory="Profile 3"

You can find the names of the profiles with this query:

## List Profile Names

	dir $env:LOCALAPPDATA"\Google\Chrome\User Data" cookies -rec |
		% PSParentPath |
			% { $_.split('\\')[-1] }