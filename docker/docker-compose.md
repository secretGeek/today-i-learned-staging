# Docker compose

Docker Compose is a tool that lets you run more than one container at a time, with links / dependencies between them.

This is often called "Orchestration" because that's a lovely word isn't it. "Plumbing" is a more accurate term, but "Orchestration" sounds better.

Docker Compose's orchestra of containers are defined in a docker compose YAML file (`docker-compose.yml`).

It is particularly well suited for local development and testing, though it can also be used in production.

In production, alternative "Container Orchestration" techniques such as Kubernetes are more widely used.


## To run a `docker-compose.yml` file

(Assuming you have docker desktop, and it is currently running, and that docker tooling, such as `docker-compose` is available on the command line)

Navigate to the folder which contains the `docker-compose.yml` file, and call:

	docker-compose up

This will:

- If necessary, download the container images referenced in the compose file.
- Run the images (i.e. start "containers" based on the downloaded images) with the connections and dependencies (the plumbing) as described in the docker compose file. (Sorry I mean the 'orchestration')

## To stop the Orchestra of containers, to stop the `docker-compose.yml` images from running....


What goes up, must come down. To stop all those running containers from running, execute the complementary command, "down", like so:

	docker-compose down





## Override the behaviour of `docker-compose.yml` by using a `docker-compose.override.yml` file

When you're writing code, you need to be able to run it locally for development purposes, and later run it perhaps in a test environment, a pre-prod and a production environment.

Here's the dealio with "override.yml". You setup the `docker-compose.yml` file, as you would like it to be when run in a production environment.

Then, if you wish, you can create a 



## Source(s)

- [Docker Compose overview](https://docs.docker.com/compose/)

## See also

- [DOCKER - the absolute basics](the_basics.md)
