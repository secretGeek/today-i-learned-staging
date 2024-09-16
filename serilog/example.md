# seqcli


Commandline tool for [seq (see overview)](https://docs.datalust.co/docs/an-overview-of-seq).

> Supports logging (`seqcli log`), searching (`seqcli search`), tailing (`seqcli tail`), querying (`seqcli query`) and JSON or plain-text log file ingestion (`seqcli ingest`), and much more.
> &mdash; [seqcli at github](https://github.com/datalust/seqcli)

Get it from [datalust](https://github.com/datalust/) at <https://github.com/datalust/seqcli>

Or get it via `dotnet`

	dotnet tool install --global seqcli

-----

	> seqcli -?

	Usage: seqcli <command> [<args>]
	Type `seqcli help` for available commands

## `seqcli help`

Show information about available commands

## Commands (and sub-commands)

- `seqcli apikey`
	- `seqcli apikey create`
	- `seqcli apikey list`
	- `seqcli apikey remove`
	- `seqcli apikey update`
- `seqcli app`
	- `seqcli app define`
	- `seqcli app install`
	- `seqcli app list`
	- `seqcli app run`
	- `seqcli app uninstall`
	- `seqcli app update`
- `seqcli appinstance`
	- `seqcli appinstance create`
	- `seqcli appinstance list`
	- `seqcli appinstance remove`
	- `seqcli appinstance update`
- `seqcli bench`
- `seqcli config`
- `seqcli dashboard`
	- `seqcli dashboard list`
	- `seqcli dashboard remove`
	- `seqcli dashboard render`
- `seqcli expressionindex`
	- `seqcli expressionindex create`
	- `seqcli expressionindex list`
	- `seqcli expressionindex remove`
- `seqcli feed`
	- `seqcli feed create`
	- `seqcli feed list`
	- `seqcli feed remove`
	- `seqcli feed update`
- `seqcli help`
	- `seqcli help seqcli`
- `seqcli index`
	- `seqcli index list`
	- `seqcli index suppress`
- `seqcli ingest`
	- `seqcli ingest seqcli`
- `seqcli license`
	- `seqcli license apply`
- `seqcli log`
	- `seqcli log seqcli`
- `seqcli node`
	- `seqcli node demote`
	- `seqcli node health`
	- `seqcli node list`
- `seqcli print`
	- `seqcli print seqcli`
- `seqcli profile`
	- `seqcli profile create`
	- `seqcli profile list`
	- `seqcli profile remove`
- `seqcli query`
	- `seqcli query seqcli`
- `seqcli retention`
	- `seqcli retention create`
	- `seqcli retention list`
	- `seqcli retention remove`
	- `seqcli retention update`
- `seqcli sample`
	- `seqcli sample ingest`
	- `seqcli sample setup`
- `seqcli search`
	- `seqcli search seqcli`
- `seqcli setting`
	- `seqcli setting clear`
	- `seqcli setting names`
	- `seqcli setting set`
	- `seqcli setting show`
- `seqcli signal`
	- `seqcli signal create`
	- `seqcli signal import`
	- `seqcli signal list`
	- `seqcli signal remove`
	- `seqcli signal update`
- `seqcli tail`
- `seqcli template`
	- `seqcli template export`
	- `seqcli template import`
- `seqcli user`
	- `seqcli user create`
	- `seqcli user list`
	- `seqcli user remove`
	- `seqcli user update`
- `seqcli version`
- `seqcli workspace`
	- `seqcli workspace create`
	- `seqcli workspace list`
	- `seqcli workspace remove`
	- `seqcli workspace update`

## `seqcli apikey`

	(usage)Usage: seqcli apikey <sub-command> [<args>]
	(usage)
	(available)Available sub-commands are:
	(available)  create      Create an API key for automation or ingestion
	(available)  list        List available API keys
	(available)  remove      Remove an API key from the server
	(available)  update      Update an existing API key
	(available)
	(type)Type `seqcli help apikey <sub-command>` for detailed help

### `seqcli apikey create`

	seqcli apikey create [<args>]
	
	Create an API key for automation or ingestion
	
	Example:
	  seqcli apikey create -t 'Test API Key' -p Environment=Test
	

### `seqcli apikey list`

	seqcli apikey list [<args>]
	
	List available API keys
	
	Example:
	  seqcli apikey list
	

### `seqcli apikey remove`

	seqcli apikey remove [<args>]
	
	Remove an API key from the server
	
	Example:
	  seqcli apikey remove -t 'Test API Key'
	

### `seqcli apikey update`

	seqcli apikey update [<args>]
	
	Update an existing API key
	
	Example:
	  seqcli apikey update --json '{...}'
	

-----


## `seqcli app`

	(usage)Usage: seqcli app <sub-command> [<args>]
	(usage)
	(available)Available sub-commands are:
	(available)  define      Generate an app definition for a .NET `[SeqApp]` plug-in
	(available)  install     Install an app package
	(available)  list        List installed app packages
	(available)  run         Host a .NET `[SeqApp]` plug-in
	(available)  uninstall   Uninstall an app package
	(available)  update      Update an installed app package
	(available)
	(type)Type `seqcli help app <sub-command>` for detailed help

### `seqcli app define`

	seqcli app define [<args>]
	
	Generate an app definition for a .NET `[SeqApp]` plug-in
	
	Example:
	  seqcli app define -d "./bin/Debug/netstandard2.2"
	

### `seqcli app install`

	seqcli app install [<args>]
	
	Install an app package
	
	Example:
	  seqcli app install --package-id 'Seq.App.JsonArchive'
	

### `seqcli app list`

	seqcli app list [<args>]
	
	List installed app packages
	
	Example:
	  seqcli app list
	

### `seqcli app run`

	seqcli app run [<args>]
	
	Host a .NET `[SeqApp]` plug-in
	
	Example:
	  seqcli tail --json | seqcli app run -d "./bin/Debug/netstandard2.2" -p ToAddress=example@example.com
	

### `seqcli app uninstall`

	seqcli app uninstall [<args>]
	
	Uninstall an app package
	
	Example:
	  seqcli app uninstall --package-id 'Seq.App.JsonArchive'
	

### `seqcli app update`

	seqcli app update [<args>]
	
	Update an installed app package
	
	Example:
	  seqcli app update -n 'HTML Email'
	

-----


## `seqcli appinstance`

	(usage)Usage: seqcli appinstance <sub-command> [<args>]
	(usage)
	(available)Available sub-commands are:
	(available)  create      Create an instance of an installed app
	(available)  list        List instances of installed apps
	(available)  remove      Remove an app instance from the server
	(available)  update      Update an existing app instance
	(available)
	(type)Type `seqcli help appinstance <sub-command>` for detailed help

### `seqcli appinstance create`

	seqcli appinstance create [<args>]
	
	Create an instance of an installed app
	
	Example:
	  seqcli appinstance create -t 'Email Ops' --app hostedapp-314159 -p To=ops@example.com
	

### `seqcli appinstance list`

	seqcli appinstance list [<args>]
	
	List instances of installed apps
	
	Example:
	  seqcli appinstance list
	

### `seqcli appinstance remove`

	seqcli appinstance remove [<args>]
	
	Remove an app instance from the server
	
	Example:
	  seqcli appinstance remove -t 'Email Ops'
	

### `seqcli appinstance update`

	seqcli appinstance update [<args>]
	
	Update an existing app instance
	
	Example:
	  seqcli appinstance update --json '{...}'
	

-----


## `seqcli bench`

	(none)seqcli bench [<args>]
	(none)
	(none)Measure query performance
	(none)
	(argument)Arguments:
	(argument)  -r, --runs=VALUE           The number of runs to execute; the default is 10
	(argument)  -c, --cases=VALUE          A JSON file containing the set of cases to run.
	(argument)                               Defaults to a standard set of cases.
	(argument)  -s, --server=VALUE         The URL of the Seq server; by default the `
	(argument)                               connection.serverUrl` config value will be used
	(argument)  -a, --apikey=VALUE         The API key to use when connecting to the server;
	(argument)                               by default the `connection.apiKey` config
	(argument)                               value will be used
	(argument)      --profile=VALUE        A connection profile to use; by default the `
	(argument)                               connection.serverUrl` and `connection.apiKey`
	(argument)                               config values will be used
	(argument)      --start=VALUE          ISO 8601 date/time to query from
	(argument)      --end=VALUE            ISO 8601 date/time to query to
	(argument)      --reporting-server=VALUE
	(argument)                             The address of a Seq server to send bench results
	(argument)                               to
	(argument)      --reporting-apikey=VALUE
	(argument)                             The API key to use when connecting to the
	(argument)                               reporting server
	(argument)      --description=VALUE    Optional description of the bench test run
	(argument)      --with-ingestion       Should the benchmark include sending events to Seq
	(argument)      --with-queries         Should the benchmark include querying Seq
	(argument)      --verbose              Print verbose output to `STDERR`

-----


## `seqcli config`

	(none)seqcli config [<args>]
	(none)
	(none)View and set fields in the `SeqCli.json` file; run with no arguments to list all fields
	(none)
	(argument)Arguments:
	(argument)  -k, --key=VALUE            The field, for example `connection.serverUrl`
	(argument)  -v, --value=VALUE          The field value; if not specified, the command
	(argument)                               will print the current value
	(argument)  -c, --clear                Clear the field
	(argument)      --verbose              Print verbose output to `STDERR`

-----


## `seqcli dashboard`

	(usage)Usage: seqcli dashboard <sub-command> [<args>]
	(usage)
	(available)Available sub-commands are:
	(available)  list        List dashboards
	(available)  remove      Remove a dashboard from the server
	(available)  render      Produce a CSV or JSON result set from a dashboard chart
	(available)
	(type)Type `seqcli help dashboard <sub-command>` for detailed help

### `seqcli dashboard list`

	seqcli dashboard list [<args>]
	
	List dashboards
	
	Example:
	  seqcli dashboard list
	

### `seqcli dashboard remove`

	seqcli dashboard remove [<args>]
	
	Remove a dashboard from the server
	
	Example:
	  seqcli dashboard remove -i dashboard-159
	

### `seqcli dashboard render`

	seqcli dashboard render [<args>]
	
	Produce a CSV or JSON result set from a dashboard chart
	
	Example:
	  seqcli dashboard render -i dashboard-159 -c 'Response Time (ms)' --last 7d --by 1h
	

-----


## `seqcli expressionindex`

	(usage)Usage: seqcli expressionindex <sub-command> [<args>]
	(usage)
	(available)Available sub-commands are:
	(available)  create      Create an expression index
	(available)  list        List expression indexes
	(available)  remove      Remove an expression index from the server
	(available)
	(type)Type `seqcli help expressionindex <sub-command>` for detailed help

### `seqcli expressionindex create`

	seqcli expressionindex create [<args>]
	
	Create an expression index
	
	Example:
	  seqcli expressionindex create --expression "ServerName"
	

### `seqcli expressionindex list`

	seqcli expressionindex list [<args>]
	
	List expression indexes
	
	Example:
	  seqcli expressionindex list
	

### `seqcli expressionindex remove`

	seqcli expressionindex remove [<args>]
	
	Remove an expression index from the server
	
	Example:
	  seqcli expressionindex -i expressionindex-2529
	

-----


## `seqcli feed`

	(usage)Usage: seqcli feed <sub-command> [<args>]
	(usage)
	(available)Available sub-commands are:
	(available)  create      Create a NuGet feed
	(available)  list        List NuGet feeds
	(available)  remove      Remove a NuGet feed from the server
	(available)  update      Update an existing NuGet feed
	(available)
	(type)Type `seqcli help feed <sub-command>` for detailed help

### `seqcli feed create`

	seqcli feed create [<args>]
	
	Create a NuGet feed
	
	Example:
	  seqcli feed create -n 'CI' --location="https://f.feedz.io/example/ci" -u Seq --password-stdin
	

### `seqcli feed list`

	seqcli feed list [<args>]
	
	List NuGet feeds
	
	Example:
	  seqcli feed list
	

### `seqcli feed remove`

	seqcli feed remove [<args>]
	
	Remove a NuGet feed from the server
	
	Example:
	  seqcli feed remove -n CI
	

### `seqcli feed update`

	seqcli feed update [<args>]
	
	Update an existing NuGet feed
	
	Example:
	  seqcli feed update --json '{...}'
	

-----


## `seqcli help`

	(none)seqcli help [<args>]
	(none)
	(none)Show information about available commands
	(none)
	(example)Example:
	(example)  seqcli help search
	(example)
	(argument)Arguments:
	(argument)  -m, --markdown             Generate markdown for use in documentation
	(argument)      --verbose              Print verbose output to `STDERR`

### `seqcli help seqcli`

	Usage: seqcli help <sub-command> [<args>]
	
	Available sub-commands are:
	              Show information about available commands
	
	Type `seqcli help help <sub-command>` for detailed help

-----


## `seqcli index`

	(usage)Usage: seqcli index <sub-command> [<args>]
	(usage)
	(available)Available sub-commands are:
	(available)  list        List indexes
	(available)  suppress    Suppress an index
	(available)
	(type)Type `seqcli help index <sub-command>` for detailed help

### `seqcli index list`

	seqcli index list [<args>]
	
	List indexes
	
	Example:
	  seqcli index list
	

### `seqcli index suppress`

	seqcli index suppress [<args>]
	
	Suppress an index
	
	Example:
	  seqcli index suppress -i index-2191448f1d9b4f22bd32c6edef752748
	

-----


## `seqcli ingest`

	(none)seqcli ingest [<args>]
	(none)
	(none)Send log events from a file or `STDIN`
	(none)
	(example)Example:
	(example)  seqcli ingest -i log-*.txt --json --filter="@Level <> 'Debug'" -p Environment=Test
	(example)
	(argument)Arguments:
	(argument)  -i, --input=VALUE          File(s) to ingest, including the `*` wildcard; if
	(argument)                               not specified, `STDIN` will be used
	(argument)      --invalid-data=VALUE   Specify how invalid data is handled: `fail` (
	(argument)                               default) or `ignore`
	(argument)  -p, --property=NAME=VALUE  Specify name/value properties, e.g. `-p Customer=
	(argument)                               C123 -p Environment=Production`
	(argument)  -x, --extract=VALUE        An extraction pattern to apply to plain-text logs
	(argument)                               (ignored when `--json` is specified)
	(argument)      --json                 Read the events as JSON (the default assumes
	(argument)                               plain text)
	(argument)  -f, --filter=VALUE         Filter expression to select a subset of events
	(argument)  -m, --message=VALUE        A message to associate with the ingested events;
	(argument)                               https://messagetemplates.org syntax is
	(argument)                               supported
	(argument)  -l, --level=VALUE          The level or severity to associate with the
	(argument)                               ingested events; this will override any level
	(argument)                               information present in the events themselves
	(argument)      --send-failure=VALUE   Specify how connection failures are handled: `
	(argument)                               fail` (default), `retry`, `continue`, or `
	(argument)                               ignore`
	(argument)  -s, --server=VALUE         The URL of the Seq server; by default the `
	(argument)                               connection.serverUrl` config value will be used
	(argument)  -a, --apikey=VALUE         The API key to use when connecting to the server;
	(argument)                               by default the `connection.apiKey` config
	(argument)                               value will be used
	(argument)      --profile=VALUE        A connection profile to use; by default the `
	(argument)                               connection.serverUrl` and `connection.apiKey`
	(argument)                               config values will be used
	(argument)      --batch-size=VALUE     The maximum number of events to send in each
	(argument)                               request to the ingestion endpoint; if not
	(argument)                               specified a value of `100` will be used
	(argument)      --verbose              Print verbose output to `STDERR`

### `seqcli ingest seqcli`

	Usage: seqcli ingest <sub-command> [<args>]
	
	Available sub-commands are:
	              Send log events from a file or `STDIN`
	
	Type `seqcli help ingest <sub-command>` for detailed help

-----


## `seqcli license`

	(usage)Usage: seqcli license <sub-command> [<args>]
	(usage)
	(available)Available sub-commands are:
	(available)  apply       Apply a license to the Seq server
	(available)
	(type)Type `seqcli help license <sub-command>` for detailed help

### `seqcli license apply`

	seqcli license apply [<args>]
	
	Apply a license to the Seq server
	
	Example:
	  seqcli license apply --certificate="license.txt"
	

-----


## `seqcli log`

	(none)seqcli log [<args>]
	(none)
	(none)Send a structured log event to the server
	(none)
	(example)Example:
	(example)  seqcli log -m 'Hello, {Name}!' -p Name=World -p App=Test
	(example)
	(argument)Arguments:
	(argument)  -m, --message=VALUE        A message to associate with the event (the
	(argument)                               default is to send no message); https://
	(argument)                               messagetemplates.org syntax is supported
	(argument)  -l, --level=VALUE          The level or severity of the event (the default
	(argument)                               is `Information`)
	(argument)  -t, --timestamp=VALUE      The event timestamp as ISO-8601 (the current UTC
	(argument)                               timestamp will be used by default)
	(argument)  -x, --exception=VALUE      Additional exception or error information to send,
	(argument)                                if any
	(argument)  -p, --property=NAME=VALUE  Specify name/value properties, e.g. `-p Customer=
	(argument)                               C123 -p Environment=Production`
	(argument)  -s, --server=VALUE         The URL of the Seq server; by default the `
	(argument)                               connection.serverUrl` config value will be used
	(argument)  -a, --apikey=VALUE         The API key to use when connecting to the server;
	(argument)                               by default the `connection.apiKey` config
	(argument)                               value will be used
	(argument)      --profile=VALUE        A connection profile to use; by default the `
	(argument)                               connection.serverUrl` and `connection.apiKey`
	(argument)                               config values will be used
	(argument)      --verbose              Print verbose output to `STDERR`

### `seqcli log seqcli`

	Usage: seqcli log <sub-command> [<args>]
	
	Available sub-commands are:
	              Send a structured log event to the server
	
	Type `seqcli help log <sub-command>` for detailed help

-----


## `seqcli node`

	(usage)Usage: seqcli node <sub-command> [<args>]
	(usage)
	(available)Available sub-commands are:
	(available)  demote      Begin demotion of the current leader node
	(available)  health      Probe a Seq node's `/health` endpoint, and print the returned HTTP s
	(available)              tatus code, or 'Unreachable' if the endpoint could not be queried
	(available)  list        List nodes in the Seq cluster
	(available)
	(type)Type `seqcli help node <sub-command>` for detailed help

### `seqcli node demote`

	seqcli node demote [<args>]
	
	Begin demotion of the current leader node
	
	Example:
	  seqcli node demote --verbose --wait
	

### `seqcli node health`

	seqcli node health [<args>]
	
	Probe a Seq node's `/health` endpoint, and print the returned HTTP status code, or 'Unreachable' if the endpoint could not be queried
	
	Example:
	  seqcli node health -s https://seq-2.example.com
	

### `seqcli node list`

	seqcli node list [<args>]
	
	List nodes in the Seq cluster
	
	Example:
	  seqcli node list --json
	

-----


## `seqcli print`

	(none)seqcli print [<args>]
	(none)
	(none)Pretty-print events in CLEF/JSON format, from a file or `STDIN`
	(none)
	(example)Example:
	(example)  seqcli print -i log-20201028.clef
	(example)
	(argument)Arguments:
	(argument)  -i, --input=VALUE          CLEF file to read, including the `*` wildcard; if
	(argument)                               not specified, `STDIN` will be used
	(argument)  -f, --filter=VALUE         Filter expression to select a subset of events
	(argument)      --template=VALUE       Specify an output template to control plain text
	(argument)                               formatting
	(argument)      --invalid-data=VALUE   Specify how invalid data is handled: `fail` (
	(argument)                               default) or `ignore`
	(argument)      --no-color             Don't colorize text output
	(argument)      --force-color          Force redirected output to have ANSI color (
	(argument)                               unless `--no-color` is also specified)
	(argument)      --verbose              Print verbose output to `STDERR`

### `seqcli print seqcli`

	Usage: seqcli print <sub-command> [<args>]
	
	Available sub-commands are:
	              Pretty-print events in CLEF/JSON format, from a file or `STDIN`
	
	Type `seqcli help print <sub-command>` for detailed help

-----


## `seqcli profile`

	(usage)Usage: seqcli profile <sub-command> [<args>]
	(usage)
	(available)Available sub-commands are:
	(available)  create      Create or replace a connection profile
	(available)  list        List connection profiles
	(available)  remove      Remove a connection profile
	(available)
	(type)Type `seqcli help profile <sub-command>` for detailed help

### `seqcli profile create`

	seqcli profile create [<args>]
	
	Create or replace a connection profile
	
	Example:
	  seqcli profile create -n Production -s https://seq.example.com -a th15ISanAPIk3y
	

### `seqcli profile list`

	seqcli profile list
	
	List connection profiles
	
	Example:
	  seqcli profile list
	

### `seqcli profile remove`

	seqcli profile remove [<args>]
	
	Remove a connection profile
	
	Example:
	  seqcli profile remove -n Production
	

-----


## `seqcli query`

	(none)seqcli query [<args>]
	(none)
	(none)Execute an SQL query and receive results in CSV format
	(none)
	(example)Example:
	(example)  seqcli query -q "select count(*) from stream group by @Level" --start="2018-02-28T13:00Z"
	(example)
	(argument)Arguments:
	(argument)  -q, --query=VALUE          The query to execute
	(argument)      --start=VALUE          ISO 8601 date/time to query from
	(argument)      --end=VALUE            ISO 8601 date/time to query to
	(argument)      --signal=VALUE         A signal expression or list of intersected signal
	(argument)                               ids to apply, for example `signal-1,signal-2`
	(argument)      --timeout=VALUE        The execution timeout in milliseconds
	(argument)      --json                 Print output in newline-delimited JSON (the
	(argument)                               default is plain text)
	(argument)      --no-color             Don't colorize text output
	(argument)      --force-color          Force redirected output to have ANSI color (
	(argument)                               unless `--no-color` is also specified)
	(argument)  -s, --server=VALUE         The URL of the Seq server; by default the `
	(argument)                               connection.serverUrl` config value will be used
	(argument)  -a, --apikey=VALUE         The API key to use when connecting to the server;
	(argument)                               by default the `connection.apiKey` config
	(argument)                               value will be used
	(argument)      --profile=VALUE        A connection profile to use; by default the `
	(argument)                               connection.serverUrl` and `connection.apiKey`
	(argument)                               config values will be used
	(argument)      --verbose              Print verbose output to `STDERR`

### `seqcli query seqcli`

	Usage: seqcli query <sub-command> [<args>]
	
	Available sub-commands are:
	              Execute an SQL query and receive results in CSV format
	
	Type `seqcli help query <sub-command>` for detailed help

-----


## `seqcli retention`

	(usage)Usage: seqcli retention <sub-command> [<args>]
	(usage)
	(available)Available sub-commands are:
	(available)  create      Create a retention policy
	(available)  list        List retention policies
	(available)  remove      Remove a retention policy from the server
	(available)  update      Update an existing retention policy
	(available)
	(type)Type `seqcli help retention <sub-command>` for detailed help

### `seqcli retention create`

	seqcli retention create [<args>]
	
	Create a retention policy
	
	Example:
	  seqcli retention create --after 30d --delete-all-events
	

### `seqcli retention list`

	seqcli retention list [<args>]
	
	List retention policies
	
	Example:
	  seqcli retention list
	

### `seqcli retention remove`

	seqcli retention remove [<args>]
	
	Remove a retention policy from the server
	
	Example:
	  seqcli retention remove -i retentionpolicy-17
	

### `seqcli retention update`

	seqcli retention update [<args>]
	
	Update an existing retention policy
	
	Example:
	  seqcli retention update --json '{...}'
	

-----


## `seqcli sample`

	(usage)Usage: seqcli sample <sub-command> [<args>]
	(usage)
	(available)Available sub-commands are:
	(available)  ingest      Log sample events into a Seq instance
	(available)  setup       Configure a Seq instance with sample dashboards, signals, users, and
	(available)               so on
	(available)
	(type)Type `seqcli help sample <sub-command>` for detailed help

### `seqcli sample ingest`

	seqcli sample ingest [<args>]
	
	Log sample events into a Seq instance
	
	Example:
	  seqcli sample ingest
	

### `seqcli sample setup`

	seqcli sample setup [<args>]
	
	Configure a Seq instance with sample dashboards, signals, users, and so on
	
	Example:
	  seqcli sample setup
	

-----


## `seqcli search`

	(none)seqcli search [<args>]
	(none)
	(none)Retrieve log events that match a given filter
	(none)
	(example)Example:
	(example)  seqcli search -f "@Exception like '%TimeoutException%'" -c 30
	(example)
	(argument)Arguments:
	(argument)  -f, --filter=VALUE         A filter to apply to the search, for example `
	(argument)                               Host = 'xmpweb-01.example.com'`
	(argument)  -c, --count=VALUE          The maximum number of events to retrieve; the
	(argument)                               default is 1
	(argument)      --start=VALUE          ISO 8601 date/time to query from
	(argument)      --end=VALUE            ISO 8601 date/time to query to
	(argument)      --json                 Print output in newline-delimited JSON (the
	(argument)                               default is plain text)
	(argument)      --no-color             Don't colorize text output
	(argument)      --force-color          Force redirected output to have ANSI color (
	(argument)                               unless `--no-color` is also specified)
	(argument)      --signal=VALUE         A signal expression or list of intersected signal
	(argument)                               ids to apply, for example `signal-1,signal-2`
	(argument)      --request-timeout=VALUE
	(argument)                             The time allowed for retrieving each page of
	(argument)                               events, in milliseconds; the default is 100000
	(argument)  -s, --server=VALUE         The URL of the Seq server; by default the `
	(argument)                               connection.serverUrl` config value will be used
	(argument)  -a, --apikey=VALUE         The API key to use when connecting to the server;
	(argument)                               by default the `connection.apiKey` config
	(argument)                               value will be used
	(argument)      --profile=VALUE        A connection profile to use; by default the `
	(argument)                               connection.serverUrl` and `connection.apiKey`
	(argument)                               config values will be used
	(argument)      --verbose              Print verbose output to `STDERR`

### `seqcli search seqcli`

	Usage: seqcli search <sub-command> [<args>]
	
	Available sub-commands are:
	              Retrieve log events that match a given filter
	
	Type `seqcli help search <sub-command>` for detailed help

-----


## `seqcli setting`

	(usage)Usage: seqcli setting <sub-command> [<args>]
	(usage)
	(available)Available sub-commands are:
	(available)  clear       Clear a runtime-configurable server setting
	(available)  names       Print the names of all supported settings
	(available)  set         Change a runtime-configurable server setting
	(available)  show        Print the current value of a runtime-configurable server setting
	(available)
	(type)Type `seqcli help setting <sub-command>` for detailed help

### `seqcli setting clear`

	seqcli setting clear [<args>]
	
	Clear a runtime-configurable server setting
	

### `seqcli setting names`

	seqcli setting names
	
	Print the names of all supported settings
	

### `seqcli setting set`

	seqcli setting set [<args>]
	
	Change a runtime-configurable server setting
	

### `seqcli setting show`

	seqcli setting show [<args>]
	
	Print the current value of a runtime-configurable server setting
	

-----


## `seqcli signal`

	(usage)Usage: seqcli signal <sub-command> [<args>]
	(usage)
	(available)Available sub-commands are:
	(available)  create      Create a signal
	(available)  import      Import signals in newline-delimited JSON format
	(available)  list        List available signals
	(available)  remove      Remove a signal from the server
	(available)  update      Update an existing signal
	(available)
	(type)Type `seqcli help signal <sub-command>` for detailed help

### `seqcli signal create`

	seqcli signal create [<args>]
	
	Create a signal
	
	Example:
	  seqcli signal create -t 'Exceptions' -f "@Exception is not null"
	

### `seqcli signal import`

	seqcli signal import [<args>]
	
	Import signals in newline-delimited JSON format
	
	Example:
	  seqcli signal import -i ./Exceptions.json
	

### `seqcli signal list`

	seqcli signal list [<args>]
	
	List available signals
	
	Example:
	  seqcli signal list
	

### `seqcli signal remove`

	seqcli signal remove [<args>]
	
	Remove a signal from the server
	
	Example:
	  seqcli signal remove -t 'Test Signal'
	

### `seqcli signal update`

	seqcli signal update [<args>]
	
	Update an existing signal
	
	Example:
	  seqcli signal update --json '{...}'
	

-----


## `seqcli tail`

	(none)seqcli tail [<args>]
	(none)
	(none)Stream log events matching a filter
	(none)
	(argument)Arguments:
	(argument)  -f, --filter=VALUE         An optional server-side filter to apply to the
	(argument)                               stream, for example `@Level = 'Error'`
	(argument)      --json                 Print output in newline-delimited JSON (the
	(argument)                               default is plain text)
	(argument)      --no-color             Don't colorize text output
	(argument)      --force-color          Force redirected output to have ANSI color (
	(argument)                               unless `--no-color` is also specified)
	(argument)      --signal=VALUE         A signal expression or list of intersected signal
	(argument)                               ids to apply, for example `signal-1,signal-2`
	(argument)  -s, --server=VALUE         The URL of the Seq server; by default the `
	(argument)                               connection.serverUrl` config value will be used
	(argument)  -a, --apikey=VALUE         The API key to use when connecting to the server;
	(argument)                               by default the `connection.apiKey` config
	(argument)                               value will be used
	(argument)      --profile=VALUE        A connection profile to use; by default the `
	(argument)                               connection.serverUrl` and `connection.apiKey`
	(argument)                               config values will be used
	(argument)      --verbose              Print verbose output to `STDERR`

-----


## `seqcli template`

	(usage)Usage: seqcli template <sub-command> [<args>]
	(usage)
	(available)Available sub-commands are:
	(available)  export      Export entities into template files
	(available)  import      Import entities from template files
	(available)
	(type)Type `seqcli help template <sub-command>` for detailed help

### `seqcli template export`

	seqcli template export [<args>]
	
	Export entities into template files
	
	Example:
	  seqcli template export -o ./Templates
	

### `seqcli template import`

	seqcli template import [<args>]
	
	Import entities from template files
	
	Example:
	  seqcli template import -i ./Templates
	

-----


## `seqcli user`

	(usage)Usage: seqcli user <sub-command> [<args>]
	(usage)
	(available)Available sub-commands are:
	(available)  create      Create a user
	(available)  list        List users
	(available)  remove      Remove a user from the server
	(available)  update      Update an existing user
	(available)
	(type)Type `seqcli help user <sub-command>` for detailed help

### `seqcli user create`

	seqcli user create [<args>]
	
	Create a user
	
	Example:
	  seqcli user create -n alice -d 'Alice Example' -r 'User (read/write)' --password-stdin
	

### `seqcli user list`

	seqcli user list [<args>]
	
	List users
	
	Example:
	  seqcli user list
	

### `seqcli user remove`

	seqcli user remove [<args>]
	
	Remove a user from the server
	
	Example:
	  seqcli user remove -n alice
	

### `seqcli user update`

	seqcli user update [<args>]
	
	Update an existing user
	
	Example:
	  seqcli user update --json '{...}'
	

-----


## `seqcli version`

	(none)seqcli version
	(none)
	(none)Print the current executable version
	(none)
	(argument)Arguments:
	(argument)      --verbose              Print verbose output to `STDERR`

-----


## `seqcli workspace`

	(usage)Usage: seqcli workspace <sub-command> [<args>]
	(usage)
	(available)Available sub-commands are:
	(available)  create      Create a workspace
	(available)  list        List available workspaces
	(available)  remove      Remove a workspace from the server
	(available)  update      Update an existing workspace
	(available)
	(type)Type `seqcli help workspace <sub-command>` for detailed help

### `seqcli workspace create`

	seqcli workspace create [<args>]
	
	Create a workspace
	
	Example:
	  seqcli workspace create -t 'My Workspace' -c signal-314159 -c dashboard-628318
	

### `seqcli workspace list`

	seqcli workspace list [<args>]
	
	List available workspaces
	
	Example:
	  seqcli workspace list
	

### `seqcli workspace remove`

	seqcli workspace remove [<args>]
	
	Remove a workspace from the server
	
	Example:
	  seqcli workspace remove -t 'My Workspace'
	

### `seqcli workspace update`

	seqcli workspace update [<args>]
	
	Update an existing workspace
	
	Example:
	  seqcli workspace update --json '{...}'
	

-----

