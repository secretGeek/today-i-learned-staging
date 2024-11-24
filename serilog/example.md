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

- [`seqcli apikey`]
	- [`seqcli apikey create`]
	- [`seqcli apikey list`]
	- [`seqcli apikey remove`]
	- [`seqcli apikey update`]
- [`seqcli app`]
	- [`seqcli app define`]
	- [`seqcli app install`]
	- [`seqcli app list`]
	- [`seqcli app run`]
	- [`seqcli app uninstall`]
	- [`seqcli app update`]
- [`seqcli appinstance`]
	- [`seqcli appinstance create`]
	- [`seqcli appinstance list`]
	- [`seqcli appinstance remove`]
	- [`seqcli appinstance update`]
- [`seqcli bench`]
- [`seqcli config`]
- [`seqcli dashboard`]
	- [`seqcli dashboard list`]
	- [`seqcli dashboard remove`]
	- [`seqcli dashboard render`]
- [`seqcli expressionindex`]
	- [`seqcli expressionindex create`]
	- [`seqcli expressionindex list`]
	- [`seqcli expressionindex remove`]
- [`seqcli feed`]
	- [`seqcli feed create`]
	- [`seqcli feed list`]
	- [`seqcli feed remove`]
	- [`seqcli feed update`]
- [`seqcli help`]
	- [`seqcli help seqcli`]
- [`seqcli index`]
	- [`seqcli index list`]
	- [`seqcli index suppress`]
- [`seqcli ingest`]
	- [`seqcli ingest seqcli`]
- [`seqcli license`]
	- [`seqcli license apply`]
- [`seqcli log`]
	- [`seqcli log seqcli`]
- [`seqcli node`]
	- [`seqcli node demote`]
	- [`seqcli node health`]
	- [`seqcli node list`]
- [`seqcli print`]
	- [`seqcli print seqcli`]
- [`seqcli profile`]
	- [`seqcli profile create`]
	- [`seqcli profile list`]
	- [`seqcli profile remove`]
- [`seqcli query`]
	- [`seqcli query seqcli`]
- [`seqcli retention`]
	- [`seqcli retention create`]
	- [`seqcli retention list`]
	- [`seqcli retention remove`]
	- [`seqcli retention update`]
- [`seqcli sample`]
	- [`seqcli sample ingest`]
	- [`seqcli sample setup`]
- [`seqcli search`]
	- [`seqcli search seqcli`]
- [`seqcli setting`]
	- [`seqcli setting clear`]
	- [`seqcli setting names`]
	- [`seqcli setting set`]
	- [`seqcli setting show`]
- [`seqcli signal`]
	- [`seqcli signal create`]
	- [`seqcli signal import`]
	- [`seqcli signal list`]
	- [`seqcli signal remove`]
	- [`seqcli signal update`]
- [`seqcli tail`]
- [`seqcli template`]
	- [`seqcli template export`]
	- [`seqcli template import`]
- [`seqcli user`]
	- [`seqcli user create`]
	- [`seqcli user list`]
	- [`seqcli user remove`]
	- [`seqcli user update`]
- [`seqcli version`]
- [`seqcli workspace`]
	- [`seqcli workspace create`]
	- [`seqcli workspace list`]
	- [`seqcli workspace remove`]
	- [`seqcli workspace update`]

## `seqcli apikey`


Usage:

	seqcli apikey <sub-command> [<args>]


Available sub-commands are:

- `create`: Create an API key for automation or ingestion
- `list`: List available API keys
- `remove`: Remove an API key from the server
- `update`: Update an existing API key

Type `seqcli help apikey <sub-command>` for detailed help

### `seqcli apikey create`


Usage:

	seqcli apikey create [<args>]

Create an API key for automation or ingestion


Example:

	  seqcli apikey create -t 'Test API Key' -p Environment=Test


### `seqcli apikey list`


Usage:

	seqcli apikey list [<args>]

List available API keys


Example:

	  seqcli apikey list


### `seqcli apikey remove`


Usage:

	seqcli apikey remove [<args>]

Remove an API key from the server


Example:

	  seqcli apikey remove -t 'Test API Key'


### `seqcli apikey update`


Usage:

	seqcli apikey update [<args>]

Update an existing API key


Example:

	  seqcli apikey update --json '{...}'


-----


## `seqcli app`


Usage:

	seqcli app <sub-command> [<args>]


Available sub-commands are:

- `define`: Generate an app definition for a .NET `[SeqApp]` plug-in
- `install`: Install an app package
- `list`: List installed app packages
- `run`: Host a .NET `[SeqApp]` plug-in
- `uninstall`: Uninstall an app package
- `update`: Update an installed app package

Type `seqcli help app <sub-command>` for detailed help

### `seqcli app define`


Usage:

	seqcli app define [<args>]

Generate an app definition for a .NET `[SeqApp]` plug-in


Example:

	  seqcli app define -d "./bin/Debug/netstandard2.2"


### `seqcli app install`


Usage:

	seqcli app install [<args>]

Install an app package


Example:

	  seqcli app install --package-id 'Seq.App.JsonArchive'


### `seqcli app list`


Usage:

	seqcli app list [<args>]

List installed app packages


Example:

	  seqcli app list


### `seqcli app run`


Usage:

	seqcli app run [<args>]

Host a .NET `[SeqApp]` plug-in


Example:

	  seqcli tail --json | seqcli app run -d "./bin/Debug/netstandard2.2" -p ToAddress=example@example.com


### `seqcli app uninstall`


Usage:

	seqcli app uninstall [<args>]

Uninstall an app package


Example:

	  seqcli app uninstall --package-id 'Seq.App.JsonArchive'


### `seqcli app update`


Usage:

	seqcli app update [<args>]

Update an installed app package


Example:

	  seqcli app update -n 'HTML Email'


-----


## `seqcli appinstance`


Usage:

	seqcli appinstance <sub-command> [<args>]


Available sub-commands are:

- `create`: Create an instance of an installed app
- `list`: List instances of installed apps
- `remove`: Remove an app instance from the server
- `update`: Update an existing app instance

Type `seqcli help appinstance <sub-command>` for detailed help

### `seqcli appinstance create`


Usage:

	seqcli appinstance create [<args>]

Create an instance of an installed app


Example:

	  seqcli appinstance create -t 'Email Ops' --app hostedapp-314159 -p To=ops@example.com


### `seqcli appinstance list`


Usage:

	seqcli appinstance list [<args>]

List instances of installed apps


Example:

	  seqcli appinstance list


### `seqcli appinstance remove`


Usage:

	seqcli appinstance remove [<args>]

Remove an app instance from the server


Example:

	  seqcli appinstance remove -t 'Email Ops'


### `seqcli appinstance update`


Usage:

	seqcli appinstance update [<args>]

Update an existing app instance


Example:

	  seqcli appinstance update --json '{...}'


-----


## `seqcli bench`


Usage:

	seqcli bench [<args>]

Measure query performance


-----


## `seqcli config`


Usage:

	seqcli config [<args>]

View and set fields in the `SeqCli.json` file; run with no arguments to list all fields


-----


## `seqcli dashboard`


Usage:

	seqcli dashboard <sub-command> [<args>]


Available sub-commands are:

- `list`: List dashboards
- `remove`: Remove a dashboard from the server
- `render`: Produce a CSV or JSON result set from a dashboard chart

Type `seqcli help dashboard <sub-command>` for detailed help

### `seqcli dashboard list`


Usage:

	seqcli dashboard list [<args>]

List dashboards


Example:

	  seqcli dashboard list


### `seqcli dashboard remove`


Usage:

	seqcli dashboard remove [<args>]

Remove a dashboard from the server


Example:

	  seqcli dashboard remove -i dashboard-159


### `seqcli dashboard render`


Usage:

	seqcli dashboard render [<args>]

Produce a CSV or JSON result set from a dashboard chart


Example:

	  seqcli dashboard render -i dashboard-159 -c 'Response Time (ms)' --last 7d --by 1h


-----


## `seqcli expressionindex`


Usage:

	seqcli expressionindex <sub-command> [<args>]


Available sub-commands are:

- `create`: Create an expression index
- `list`: List expression indexes
- `remove`: Remove an expression index from the server

Type `seqcli help expressionindex <sub-command>` for detailed help

### `seqcli expressionindex create`


Usage:

	seqcli expressionindex create [<args>]

Create an expression index


Example:

	  seqcli expressionindex create --expression "ServerName"


### `seqcli expressionindex list`


Usage:

	seqcli expressionindex list [<args>]

List expression indexes


Example:

	  seqcli expressionindex list


### `seqcli expressionindex remove`


Usage:

	seqcli expressionindex remove [<args>]

Remove an expression index from the server


Example:

	  seqcli expressionindex -i expressionindex-2529


-----


## `seqcli feed`


Usage:

	seqcli feed <sub-command> [<args>]


Available sub-commands are:

- `create`: Create a NuGet feed
- `list`: List NuGet feeds
- `remove`: Remove a NuGet feed from the server
- `update`: Update an existing NuGet feed

Type `seqcli help feed <sub-command>` for detailed help

### `seqcli feed create`


Usage:

	seqcli feed create [<args>]

Create a NuGet feed


Example:

	  seqcli feed create -n 'CI' --location="https://f.feedz.io/example/ci" -u Seq --password-stdin


### `seqcli feed list`


Usage:

	seqcli feed list [<args>]

List NuGet feeds


Example:

	  seqcli feed list


### `seqcli feed remove`


Usage:

	seqcli feed remove [<args>]

Remove a NuGet feed from the server


Example:

	  seqcli feed remove -n CI


### `seqcli feed update`


Usage:

	seqcli feed update [<args>]

Update an existing NuGet feed


Example:

	  seqcli feed update --json '{...}'


-----


## `seqcli help`


Usage:

	seqcli help [<args>]

Show information about available commands


Example:

	  seqcli help search


### `seqcli help seqcli`


Usage:

	seqcli help <sub-command> [<args>]


Available sub-commands are:

- `Show`: information about available commands

Type `seqcli help help <sub-command>` for detailed help

-----


## `seqcli index`


Usage:

	seqcli index <sub-command> [<args>]


Available sub-commands are:

- `list`: List indexes
- `suppress`: Suppress an index

Type `seqcli help index <sub-command>` for detailed help

### `seqcli index list`


Usage:

	seqcli index list [<args>]

List indexes


Example:

	  seqcli index list


### `seqcli index suppress`


Usage:

	seqcli index suppress [<args>]

Suppress an index


Example:

	  seqcli index suppress -i index-2191448f1d9b4f22bd32c6edef752748


-----


## `seqcli ingest`


Usage:

	seqcli ingest [<args>]

Send log events from a file or `STDIN`


Example:

	  seqcli ingest -i log-*.txt --json --filter="@Level <> 'Debug'" -p Environment=Test


### `seqcli ingest seqcli`


Usage:

	seqcli ingest <sub-command> [<args>]


Available sub-commands are:

- `Send`: log events from a file or `STDIN`

Type `seqcli help ingest <sub-command>` for detailed help

-----


## `seqcli license`


Usage:

	seqcli license <sub-command> [<args>]


Available sub-commands are:

- `apply`: Apply a license to the Seq server

Type `seqcli help license <sub-command>` for detailed help

### `seqcli license apply`


Usage:

	seqcli license apply [<args>]

Apply a license to the Seq server


Example:

	  seqcli license apply --certificate="license.txt"


-----


## `seqcli log`


Usage:

	seqcli log [<args>]

Send a structured log event to the server


Example:

	  seqcli log -m 'Hello, {Name}!' -p Name=World -p App=Test


### `seqcli log seqcli`


Usage:

	seqcli log <sub-command> [<args>]


Available sub-commands are:

- `Send`: a structured log event to the server

Type `seqcli help log <sub-command>` for detailed help

-----


## `seqcli node`


Usage:

	seqcli node <sub-command> [<args>]


Available sub-commands are:

- `demote`: Begin demotion of the current leader node
- `health`: Probe a Seq node's `/health` endpoint, and print the returned HTTP s
- `tatus`: code, or 'Unreachable' if the endpoint could not be queried
- `list`: List nodes in the Seq cluster

Type `seqcli help node <sub-command>` for detailed help

### `seqcli node demote`


Usage:

	seqcli node demote [<args>]

Begin demotion of the current leader node


Example:

	  seqcli node demote --verbose --wait


### `seqcli node health`


Usage:

	seqcli node health [<args>]

Probe a Seq node's `/health` endpoint, and print the returned HTTP status code, or 'Unreachable' if the endpoint could not be queried


Example:

	  seqcli node health -s https://seq-2.example.com


### `seqcli node list`


Usage:

	seqcli node list [<args>]

List nodes in the Seq cluster


Example:

	  seqcli node list --json


-----


## `seqcli print`


Usage:

	seqcli print [<args>]

Pretty-print events in CLEF/JSON format, from a file or `STDIN`


Example:

	  seqcli print -i log-20201028.clef


### `seqcli print seqcli`


Usage:

	seqcli print <sub-command> [<args>]


Available sub-commands are:

- `Pretty-print`: events in CLEF/JSON format, from a file or `STDIN`

Type `seqcli help print <sub-command>` for detailed help

-----


## `seqcli profile`


Usage:

	seqcli profile <sub-command> [<args>]


Available sub-commands are:

- `create`: Create or replace a connection profile
- `list`: List connection profiles
- `remove`: Remove a connection profile

Type `seqcli help profile <sub-command>` for detailed help

### `seqcli profile create`


Usage:

	seqcli profile create [<args>]

Create or replace a connection profile


Example:

	  seqcli profile create -n Production -s https://seq.example.com -a th15ISanAPIk3y


### `seqcli profile list`


Usage:

	seqcli profile list

List connection profiles


Example:

	  seqcli profile list


### `seqcli profile remove`


Usage:

	seqcli profile remove [<args>]

Remove a connection profile


Example:

	  seqcli profile remove -n Production


-----


## `seqcli query`


Usage:

	seqcli query [<args>]

Execute an SQL query and receive results in CSV format


Example:

	  seqcli query -q "select count(*) from stream group by @Level" --start="2018-02-28T13:00Z"


### `seqcli query seqcli`


Usage:

	seqcli query <sub-command> [<args>]


Available sub-commands are:

- `Execute`: an SQL query and receive results in CSV format

Type `seqcli help query <sub-command>` for detailed help

-----


## `seqcli retention`


Usage:

	seqcli retention <sub-command> [<args>]


Available sub-commands are:

- `create`: Create a retention policy
- `list`: List retention policies
- `remove`: Remove a retention policy from the server
- `update`: Update an existing retention policy

Type `seqcli help retention <sub-command>` for detailed help

### `seqcli retention create`


Usage:

	seqcli retention create [<args>]

Create a retention policy


Example:

	  seqcli retention create --after 30d --delete-all-events


### `seqcli retention list`


Usage:

	seqcli retention list [<args>]

List retention policies


Example:

	  seqcli retention list


### `seqcli retention remove`


Usage:

	seqcli retention remove [<args>]

Remove a retention policy from the server


Example:

	  seqcli retention remove -i retentionpolicy-17


### `seqcli retention update`


Usage:

	seqcli retention update [<args>]

Update an existing retention policy


Example:

	  seqcli retention update --json '{...}'


-----


## `seqcli sample`


Usage:

	seqcli sample <sub-command> [<args>]


Available sub-commands are:

- `ingest`: Log sample events into a Seq instance
- `setup`: Configure a Seq instance with sample dashboards, signals, users, and
- `so`: on

Type `seqcli help sample <sub-command>` for detailed help

### `seqcli sample ingest`


Usage:

	seqcli sample ingest [<args>]

Log sample events into a Seq instance


Example:

	  seqcli sample ingest


### `seqcli sample setup`


Usage:

	seqcli sample setup [<args>]

Configure a Seq instance with sample dashboards, signals, users, and so on


Example:

	  seqcli sample setup


-----


## `seqcli search`


Usage:

	seqcli search [<args>]

Retrieve log events that match a given filter


Example:

	  seqcli search -f "@Exception like '%TimeoutException%'" -c 30


### `seqcli search seqcli`


Usage:

	seqcli search <sub-command> [<args>]


Available sub-commands are:

- `Retrieve`: log events that match a given filter

Type `seqcli help search <sub-command>` for detailed help

-----


## `seqcli setting`


Usage:

	seqcli setting <sub-command> [<args>]


Available sub-commands are:

- `clear`: Clear a runtime-configurable server setting
- `names`: Print the names of all supported settings
- `set`: Change a runtime-configurable server setting
- `show`: Print the current value of a runtime-configurable server setting

Type `seqcli help setting <sub-command>` for detailed help

### `seqcli setting clear`


Usage:

	seqcli setting clear [<args>]

Clear a runtime-configurable server setting


### `seqcli setting names`


Usage:

	seqcli setting names

Print the names of all supported settings


### `seqcli setting set`


Usage:

	seqcli setting set [<args>]

Change a runtime-configurable server setting


### `seqcli setting show`


Usage:

	seqcli setting show [<args>]

Print the current value of a runtime-configurable server setting


-----


## `seqcli signal`


Usage:

	seqcli signal <sub-command> [<args>]


Available sub-commands are:

- `create`: Create a signal
- `import`: Import signals in newline-delimited JSON format
- `list`: List available signals
- `remove`: Remove a signal from the server
- `update`: Update an existing signal

Type `seqcli help signal <sub-command>` for detailed help

### `seqcli signal create`


Usage:

	seqcli signal create [<args>]

Create a signal


Example:

	  seqcli signal create -t 'Exceptions' -f "@Exception is not null"


### `seqcli signal import`


Usage:

	seqcli signal import [<args>]

Import signals in newline-delimited JSON format


Example:

	  seqcli signal import -i ./Exceptions.json


### `seqcli signal list`


Usage:

	seqcli signal list [<args>]

List available signals


Example:

	  seqcli signal list


### `seqcli signal remove`


Usage:

	seqcli signal remove [<args>]

Remove a signal from the server


Example:

	  seqcli signal remove -t 'Test Signal'


### `seqcli signal update`


Usage:

	seqcli signal update [<args>]

Update an existing signal


Example:

	  seqcli signal update --json '{...}'


-----


## `seqcli tail`


Usage:

	seqcli tail [<args>]

Stream log events matching a filter


-----


## `seqcli template`


Usage:

	seqcli template <sub-command> [<args>]


Available sub-commands are:

- `export`: Export entities into template files
- `import`: Import entities from template files

Type `seqcli help template <sub-command>` for detailed help

### `seqcli template export`


Usage:

	seqcli template export [<args>]

Export entities into template files


Example:

	  seqcli template export -o ./Templates


### `seqcli template import`


Usage:

	seqcli template import [<args>]

Import entities from template files


Example:

	  seqcli template import -i ./Templates


-----


## `seqcli user`


Usage:

	seqcli user <sub-command> [<args>]


Available sub-commands are:

- `create`: Create a user
- `list`: List users
- `remove`: Remove a user from the server
- `update`: Update an existing user

Type `seqcli help user <sub-command>` for detailed help

### `seqcli user create`


Usage:

	seqcli user create [<args>]

Create a user


Example:

	  seqcli user create -n alice -d 'Alice Example' -r 'User (read/write)' --password-stdin


### `seqcli user list`


Usage:

	seqcli user list [<args>]

List users


Example:

	  seqcli user list


### `seqcli user remove`


Usage:

	seqcli user remove [<args>]

Remove a user from the server


Example:

	  seqcli user remove -n alice


### `seqcli user update`


Usage:

	seqcli user update [<args>]

Update an existing user


Example:

	  seqcli user update --json '{...}'


-----


## `seqcli version`


Usage:

	seqcli version

Print the current executable version


-----


## `seqcli workspace`


Usage:

	seqcli workspace <sub-command> [<args>]


Available sub-commands are:

- `create`: Create a workspace
- `list`: List available workspaces
- `remove`: Remove a workspace from the server
- `update`: Update an existing workspace

Type `seqcli help workspace <sub-command>` for detailed help

### `seqcli workspace create`


Usage:

	seqcli workspace create [<args>]

Create a workspace


Example:

	  seqcli workspace create -t 'My Workspace' -c signal-314159 -c dashboard-628318


### `seqcli workspace list`


Usage:

	seqcli workspace list [<args>]

List available workspaces


Example:

	  seqcli workspace list


### `seqcli workspace remove`


Usage:

	seqcli workspace remove [<args>]

Remove a workspace from the server


Example:

	  seqcli workspace remove -t 'My Workspace'


### `seqcli workspace update`


Usage:

	seqcli workspace update [<args>]

Update an existing workspace


Example:

	  seqcli workspace update --json '{...}'


-----

