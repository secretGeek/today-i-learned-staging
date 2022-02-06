# To Get AirTable Data (in Powershell)

Adam Bertram ('Adam the Automator') has written a [PSAirTable Module](https://www.powershellgallery.com/packages/PSAirTable/1.0.12), that is easy to use.

Run as administrator...

	Import-Module -Name PSAirTable

and

	Install-Module -Name PSAirTable

Source here: <https://github.com/adbertram/PSAirTable>

`PSAirTable` has these functions:

- `Get-AirTableApiKey`
- `Get-PSAirTableConfiguration`
- `Update-Record`
- `New-Record`
- `Remove-Record`
- `Save-AirTableApiKey`
- `Find-Record`
- `InvokeAirTableApiCall`

		Get-PSAirTableConfiguration

		Application      Bases
		-----------      -----
		@{ApiKey=XXXXXX} {@{Name=<name of base here>; ID=<id of base here>}}

Previously I could find a record in the `Todo` table of the `Projects` base, with:

	Find-Record Projects Todo

...but now it errors with:

	The base name [projects] could not be found. Ensure it exists by running (Get-PSAirTableConfiguration).Bases

I have my API Key from 	`airtable.com/account`

I tried to save it with:

	Save-AirTableApiKey  keyXXXXXXXXXXX

But this failed with:

	Access to the path 'C:\Program Files\WindowsPowerShell\Modules\PSAirTable\1.0.12\Configuration.json' is denied

Tried again as Administrator -- and it seems to have worked, as no error.

Tried:

	Find-Record Projects Todo

...and it works now.

## Get AirTable Data (in js / node)

If/when I need to get airtable data via JS, i'll be reading the official documentation - but also this blog post from Trys Mudford:

- [Tiny lesson: rapid builds, email signatures and Airtable](https://www.trysmudford.com/blog/rapid-building/)