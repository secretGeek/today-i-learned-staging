# Install Seq locally for development

Oh, and it uses docker. So install docker desktop first.

Seq's container image is here:

    https://hub.docker.com/r/datalust/seq/

## Create container on the commandline

**Note**: Change 'A PASSWORD HERE' to be your own preferred value

	$PasswordHash=$(echo 'A PASSWORD HERE' | docker run --rm -i datalust/seq config hash)
	mkdir "c:\temp\seq" -force

	docker run --name seq -d --restart always -e ACCEPT_EULA=Y -e SEQ_FIRSTRUN_ADMINPASSWORDHASH="$PasswordHash" -v c:\temp\seq:/data -p 8071:80 -p 5341:5341 datalust/seq

Now you'll have a local docker instance that:

- Lives here: <http://localhost:8071/> (user `admin`, password "A PASSWORD HERE" in this example, but set your own)
- Ingests any errors logged to here: <http://localhost:5341/>
- Puts its files on disk here: `c:\temp\seq`

### Note on restart always

We use `--restart always` though the example at the official references has `--restart unless-stopped`

## Verify it is running

- Visit <http://localhost:8071/> and log in with `admin` and your password from above.
- Any problem? check that the container is running, in docker desktop.

## Configure your app to log to that instance

Create a new api key, that your app will use when logging to the new endpoint. The only permission it needs is `Ingest`.

Visit <http://localhost:8071/#/settings/api-keys/new> to create the key. Copy the API key to use in your `appsettings.Development.json`.

New section in your `appsettings.Development.json` looks like this:

	 "Serilog": {
		"LevelSwitches": { "controlSwitch": "Verbose" },
		"WriteTo": [
		  {
			"Name": "Seq",
			"Args": {
			  "serverUrl": "http://localhost:5341",
			  "apiKey": "(Generate it @ 'http://localhost:8071/#/settings/api-keys/' )",
			  "controlLevelSwitch": "$controlSwitch"
			}
		  }
		]
	  }

## See also

- [DOCKER - the absolute basics.](../docker/the_basics.md)
