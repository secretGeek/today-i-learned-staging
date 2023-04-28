# Winget common activities

## Search for an available tool at any of the sources you have enabled (that you have not necessarily installed)

    winget search <appname>

## Install a tool

    winget install <appname>

## List locally installed winget packages

Note that "locally installed" means -- installed on the current computer and available to the current user. i.e. What `npm` would call "globally installed".

    winget list

Note that you don't use "*" or "?" to search for matches -- just type partial words, e.g.

    winget list edge

Will list any locally installed package with "edge" in the name.

## Upgrade an installed package

    winget upgrade <appname>

## List locally installed winget packages for which an update it available

    winget upgrade

## List available winget packages named like "linq"

    winget search linq

## See also

- [Getting Started with Winget](getting_started.md)
