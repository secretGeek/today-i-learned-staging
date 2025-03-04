# Seq Cli Help

- [apikey] &mdash; `sqcli apikey <sub-command>`
  - [apikey create](#apikey-create) &mdash; `sqcli apikey create`
  - [apikey list](#apikey-list) &mdash; `sqcli apikey list`
  - [apikey remove](#apikey-remove) &mdash; `sqcli apikey remove`
  - [apikey update](#apikey-update) &mdash; `sqcli apikey update`
- [app] &mdash; `<sub-command>`
- [appinstance] &mdash; `<sub-command>`
- [bench] &mdash; Measure query performance
- [config] &mdash; View and set fields in the `SeqCli.json` file; run with no arguments to list all fields
- [dashboard] &mdash; `<sub-command>`
- [expressionindex] &mdash; `<sub-command>`
- [feed] &mdash; `<sub-command>`
- [help] &mdash; Show information about available commands
- [index] &mdash; `<sub-command>`
- [ingest] &mdash; Send log events from a file or `STDIN`
- [license] &mdash; `<sub-command>`
- [log] &mdash; Send a structured log event to the server
- [node] &mdash; `<sub-command>`
- [print] &mdash; Pretty-print events in `CLEF/JSON` format
- [profile] &mdash; `<sub-command>`
- [query] &mdash; Execute an SQL query and receive results in `CSV` format
- [retention] &mdash; `<sub-command>`
- [sample] &mdash; `<sub-command>`
- [search] &mdash; Retrieve log events that match a given filter
- [setting] &mdash; `<sub-command>`
- [signal] &mdash; `<sub-command>`
- [tail] &mdash; Stream log events matching a filter
- [template] &mdash; `<sub-command>`
- [user] &mdash; `<sub-command>`
- [version] &mdash; Print the current executable version
- [workspace] &mdash; `<sub-command>`

## apikey

>  seqcli help apikey

Run api `<sub-command>` -- where `<sub-command>` is one of these:

- Usage: `seqcli apikey <sub-command> [<args>]`

Available sub-commands are:

- [create](#apikey-create)  &mdash;    Create an API key for automation or ingestion
- [list](#apikey-list)      &mdash;      List available API keys
- [remove](#apikey-remove)  &mdash;     Remove an API key from the server
- [update](#apikey-update)  &mdash;    Update an existing API key

Type `seqcli help apikey <sub-command>` for detailed help

## seqcli apikey create

- [list](#apikey-list)
- [remove](#apikey-remove)
- [update](#apikey-update)

## app

- `app <sub-command>`

```bash
seqcli help app
```

Usage: `seqcli app <sub-command> [<args>]`

Available sub-commands are:
  define      Generate an app definition for a .NET `[SeqApp]` plug-in
  install     Install an app package
  list        List installed app packages
  run         Host a .NET `[SeqApp]` plug-in
  uninstall   Uninstall an app package
  update      Update an installed app package

Type `seqcli help app <sub-command>` for detailed help

## appinstance

`appinstance <sub-command>`

  seqcli help appinstance

Usage: `seqcli appinstance <sub-command> [<args>]`

Available sub-commands are:
  create      Create an instance of an installed app
  list        List instances of installed apps
  remove      Remove an app instance from the server
  update      Update an existing app instance

Type `seqcli help appinstance <sub-command>` for detailed help

## bench

Measure query performance

  seqcli help bench

seqcli bench [<args>]

Measure query performance

## config

View and set fields in the `SeqCli.json` file; run with no arguments to list all fields

  seqcli help config

seqcli config [<args>]

View and set fields in the `SeqCli.json` file; run with no arguments to list all fields

## dashboard

<sub-command>

  seqcli help dashboard

Usage: `seqcli dashboard <sub-command> [<args>]`

Available sub-commands are:

  list        List dashboards
  remove      Remove a dashboard from the server
  render      Produce a CSV or JSON result set from a dashboard chart

Type `seqcli help dashboard <sub-command>` for detailed help

## expressionindex

<sub-command>

  seqcli help expressionindex

Usage: `seqcli expressionindex <sub-command> [<args>]`

Available sub-commands are:

  create      Create an expression index
  list        List expression indexes
  remove      Remove an expression index from the server

Type `seqcli help expressionindex <sub-command>` for detailed help

## feed

<sub-command>

  seqcli help feed

Usage: `seqcli feed <sub-command> [<args>]`

Available sub-commands are:
  create      Create a NuGet feed
  list        List NuGet feeds
  remove      Remove a NuGet feed from the server
  update      Update an existing NuGet feed

Type `seqcli help feed <sub-command>` for detailed help

## help

Show information about available commands

  seqcli help help

seqcli help [<args>]

Show information about available commands

Example:
  seqcli help search

## index

<sub-command>

  seqcli help index

Usage: `seqcli index <sub-command> [<args>]`

Available sub-commands are:
  list        List indexes
  suppress    Suppress an index

Type `seqcli help index <sub-command>` for detailed help

## ingest

Send log events from a file or `STDIN`

  seqcli help ingest

seqcli ingest [<args>]

Send log events from a file or `STDIN`

Example:
  seqcli ingest -i log-*.txt --json --filter="@Level <> 'Debug'" -p Environment=Test

## license

`<sub-command>`

  seqcli help license

Usage: `seqcli license <sub-command> [<args>]`

Available sub-commands are:
  apply       Apply a license to the Seq server

Type `seqcli help license <sub-command>` for detailed help

## log

Send a structured log event to the server

  seqcli help log

seqcli log [<args>]

Send a structured log event to the server

Example:
  seqcli log -m 'Hello, {Name}!' -p Name=World -p App=Test

## node

`<sub-command>`

  seqcli help node

Usage: `seqcli node <sub-command> [<args>]`

Available sub-commands are:
  demote      Begin demotion of the current leader node
  health      Probe a Seq node's `/health` endpoint, and print the returned HTTP s
              tatus code, or 'Unreachable' if the endpoint could not be queried
  list        List nodes in the Seq cluster

Type `seqcli help node <sub-command>` for detailed help

## print

Pretty-print events in CLEF/JSON format

  seqcli help print

seqcli print [<args>]

Pretty-print events in CLEF/JSON format, from a file or `STDIN`

Example:
  seqcli print -i log-20201028.clef

## profile

`<sub-command>`

  seqcli help profile

Usage: `seqcli profile <sub-command> [<args>]`

Available sub-commands are:
  create      Create or replace a connection profile
  list        List connection profiles
  remove      Remove a connection profile

Type `seqcli help profile <sub-command>` for detailed help

## query

Execute an SQL query and receive results in CSV format

  seqcli help query

seqcli query [<args>]

Execute an SQL query and receive results in CSV format

Example:
  seqcli query -q "select count(*) from stream group by @Level" --start="2018-02-28T13:00Z"

## retention

`<sub-command>`

  seqcli help retention

Usage: `seqcli retention <sub-command> [<args>]`

Available sub-commands are:
  create      Create a retention policy
  list        List retention policies
  remove      Remove a retention policy from the server
  update      Update an existing retention policy

Type `seqcli help retention <sub-command>` for detailed help

## sample

`<sub-command>`

  seqcli help sample

Usage: `seqcli sample <sub-command> [<args>]`

Available sub-commands are:
  ingest      Log sample events into a Seq instance
  setup       Configure a Seq instance with sample dashboards, signals, users, and
               so on

Type `seqcli help sample <sub-command>` for detailed help

## search

Retrieve log events that match a given filter

  seqcli help search

seqcli search [<args>]

Retrieve log events that match a given filter

Example:
  seqcli search -f "@Exception like '%TimeoutException%'" -c 30

## setting

`<sub-command>`

  seqcli help setting

Usage: `seqcli setting <sub-command> [<args>]`

Available sub-commands are:
  clear       Clear a runtime-configurable server setting
  names       Print the names of all supported settings
  set         Change a runtime-configurable server setting
  show        Print the current value of a runtime-configurable server setting

Type `seqcli help setting <sub-command>` for detailed help

## signal

`<sub-command>`

  seqcli help signal

Usage: `seqcli signal <sub-command> [<args>]`

Available sub-commands are:
  create      Create a signal
  import      Import signals in newline-delimited JSON format
  list        List available signals
  remove      Remove a signal from the server
  update      Update an existing signal

Type `seqcli help signal <sub-command>` for detailed help

## tail

Stream log events matching a filter

  seqcli help tail

seqcli tail [<args>]

Stream log events matching a filter

## template

`<sub-command>`

  seqcli help template

Usage: `seqcli template <sub-command> [<args>]`

Available sub-commands are:
  export      Export entities into template files
  import      Import entities from template files

Type `seqcli help template <sub-command>` for detailed help

## user

`<sub-command>`

  seqcli help user

Usage: `seqcli user <sub-command> [<args>]`

Available sub-commands are:
  create      Create a user
  list        List users
  remove      Remove a user from the server
  update      Update an existing user

Type `seqcli help user <sub-command>` for detailed help

## version

Print the current executable version

  seqcli help version

seqcli version

Print the current executable version

## workspace

`<sub-command>`

  seqcli help workspace

Usage: `seqcli workspace <sub-command> [<args>]`

Available sub-commands are:
  create      Create a workspace
  list        List available workspaces
  remove      Remove a workspace from the server
  update      Update an existing workspace

Type `seqcli help workspace <sub-command>` for detailed help
