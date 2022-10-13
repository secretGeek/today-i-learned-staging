# DOCKER - the absolute basics

Some terminology (which may or may not become clear at a later date.)

- A "container" is an instance of an "image" with some rules for which ports are exposed where, and possibly which volume it uses.
- An image is described by a "dockerfile" and may be built upon other images (etc.)
- Somewhere at the base of the image on which an image is based, etc... you ultimately find there is an operating system.
- Images are stored in, and retrieved from "container repositories".
- A volume is a virtual hard drive, a place where files are stored, you know... a disk.

## Getting Started

First, get docker desktop, install that on your development machine.

- Once you have docker desktop (the windows or linux version) you can then perform the following:
  - use the docker command to get / run containers, from images, with volumes and more.
    - `docker` the commandline tool, e.g. `docker.exe`
  - make your own images based on bits and pieces of existing images, +/- some shell script.
    - `dockerfile` - a plain text file with docker commands, that describes a new image (which can be run, as a container)
  - have multiple services, keeping containers running and sharing known volumes etc.
    - `docker-compose.yml` file.

## About Port numbers

When specifying port numbers used by containers, they are specified like this:

	<outside>:<inside>

For example `8888:80` means "port 8888 on the outside world, the host computer" will be mapped to "port 80 inside the container."

If Narnia is a container running inside a wardrobe, then `1234:100` would mean the wardrobe's port `1234` is mapped to Narnia's port `100`.

Note also that we would call Narnia the container and the wardrobe would be properly referred to as the **host**.

### docker on the command line

`docker`, (`docker.exe` on windows) is a command line tool for doing all sorts of dockery things.

Here is an example where we use docker to create a volume, and then create a container, based on an image, that uses that volume.

	docker volume create a-sql-volume
	docker run -d -e "ACCEPT_EULA=Y" -v a-sql-volume:/var/opt/mssql -e "SA_PASSWORD=p@$$w0rD" -p 1066:1433 -d mcr.microsoft.com/mssql/server:2019-latest

The first command creates a local "volume" (some storage space) that can be used by your containers, and names it `a-sql-volume`

The next command has a lot more going on -- let's break it down...

The general structure is:

	docker run {options} {IMAGE}

And the options specified above, if listed one at a time, are:

	-d
	-e "ACCEPT_EULA=Y"
	-v a-sql-volume:/var/opt/mssql
	-e "SA_PASSWORD=p@$$w0rD"
	-p 1066:1433
	-d

Followed by the base image, in this case: `mcr.microsoft.com/mssql/server:2019-latest`

`tip` -- For help on the `run` command and its options, use `docker run --help`

Explaining these one at a time:

- `-d`: Alias for `--detach`, meaning: Run container in background and print container ID.
- `-e`: Alias for `--env`, to set an environment variable. Environment variables are one of the most common and very lightweight techniques used for configuring the applications inside a container.
- `-v`: Alias for `--volume`, to specify the named volume that will be used, and which path inside the container it will be mounted at.
- `-p`: Alias for `--publish`, publish a container's port(s) to the host.

Finally, `mcr.microsoft.com/mssql/server:2019-latest` is the name of the image on which the container is based.

### docker cp

When a container is running, you can copy files to or from it, using `docker cp {FROM_PATH} {TO_PATH}`.

e.g.To copy a file *from* a container called "my_container", to your local file system's current path:

	docker cp my_container:/var/www/html/.htaccess ./

And conversely, to copy a file from your local file system to a path on a running container:

	docker cp ./.htaccess my_container:/var/www/html/.htaccess

## See also

- [Install Seq locally for development](../serilog/install_seq_locally_for_development.md) -- local seq install instructions, rely on docker (and put the info above into context)
