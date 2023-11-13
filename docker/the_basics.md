# DOCKER - the absolute basics

Some terminology (which may or may not become clearer at a later date.)

- A "container" is an instance of an "image" with some rules for which "ports" are exposed where, and possibly which "volume" it uses.
- An "image" is described by a "dockerfile" and is built upon other images (It's images all the way down)
	- (Somewhere at the base of the image on which an image is based, etc... you ultimately find there is an operating system. I think. I hope.)
- "Images" can be stored in, and retrieved from, "repositories", also known as "container repositories". (Why are they not called image repositories?)
- A "volume" is a virtual hard drive, a place where files are stored, you know... a disk drive, a disk, storage, long term memory, a persistence mechanism.
- A "host" is the outer computer on which a container is running. A container has limited access to the host, the host has quite good access to the container.

## Getting Started

First, get docker desktop, install that on your development machine.

No link included, as the location and the name will change before I commit this file.

You can install it on Windows or Linux or Mac. You can't install it on iOS or Android or Gameboy (as far as I know).

## What is docker?

When someone says "docker" they can mean a lot of different things! Docker this, docker that, docker all the things. Sometimes you'll feel you're out of your docking mind!

Docker is: a specific commandline tool; docker refers to the whole (waves hands vaguely) family of docker things; a docker file is a `Dockerfile` (one word) -- a "text file" that contains a pattern for making a docker image...; and docker is the first word in "docker compose" -- or "docker-compose.yml" -- a file that can describe a group of docker images that work together, a fleet of images, a symphony of images, an orchestrated milieu of containers, a deck of docks, a caravan of containers, an infestation of images, a cartload of containers...

In bullet form -- let's say:

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

### Docker on the command line

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

### Docker cp

When a container is running, you can copy files to or from it, using `docker cp {FROM_PATH} {TO_PATH}`.

e.g. To copy a file *from* a container called "my_container", to your local file system's current path:

	docker cp my_container:/var/www/html/.htaccess ./

And conversely, to copy a file from your local file system to a path on a running container called "my_container":

	docker cp ./.htaccess my_container:/var/www/html/.htaccess

## Building an image from a Dockerfile

Simplest thing that can possibly work:

With the docker daemon running (i.e. with Docker Desktop running)

In bash (or gitbash or windows subsystem for linux) or even in PowerShell -- in the same folder as your `Dockerfile`

	docker build .

After which if you use `docker images` you may see that the first image listed is the image you created.

Boom.


During the build you can also set metadata of your image -- e.g.


	docker build . --label "test=true"

... will then be found by:

	docker images --filter "label=test=true"

Or if there are multiple found, you find just the first one by:

	docker images --filter "label=test=true" -q | head -1

or in PowerShell

	docker images --filter "label=test=true" -q | select -first 1

(due to `-q` for "quiet", returns just the identifier for the image)

Get that identifier as a variable:

	export id=$(docker images --filter "label=test=true" -q | head -1)

Create an container, from that image, with a name of your own choosing...

	docker create --name "My_New_Container_Name" $id

Copy files from that container:

	docker cp My_New_Container_Name:/src/tests/MyProject/TestResults

(In this case we're copying some test results out)


## List Images in More Detail 

The `--format 'json'` parameter lets you explore the data more completely.

In Powershell I pipe that json to `ConvertFrom-Json` and turn it into objects I can really do things with.

	docker images --all --format 'json' | ConvertFrom-Json | select *
  
(Or, still in powershell, you can pipe to `Out-GridView` to explore it in a grid control)


## See also

- [Install Seq locally for development](../serilog/install_seq_locally_for_development.md) -- local seq install instructions, rely on docker (and put the info above into context)
- [Docker Compose](../docker/docker-compose)