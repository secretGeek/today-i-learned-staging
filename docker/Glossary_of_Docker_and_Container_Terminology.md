# Glossary of Docker and Container Terminology

## Containers

- **Container**: A lightweight, standalone executable package that includes everything needed to run a piece of software: code, runtime, system tools, libraries, and settings. Containers are isolated from each other and the host system.
- **Image**: A static, read-only template used to create containers. It includes the application and its dependencies. Containers are instances of images. When an image is "running", you have a container. (Container is to image, as Object is to class)
- **Container Runtime**: The software that runs and manages containers on a host machine. Docker is one example of a container runtime.

### Docker-Specific Terminology

- **Docker**: A platform that enables developers to build, ship, and run applications inside containers. It includes tools like the Docker Engine (which runs containers) and the Docker CLI (which interacts with the Docker Engine).
- **Docker (CLI)**: The command-line interface (e.g., `docker`, `docker.exe`) used to interact with Docker services, such as managing images, containers, volumes, and networks. Common commands include `docker run`, `docker pull`, `docker ps`, `docker stop`, etc.
- **Dockerfile**: A text file that contains a series of instructions for building a Docker image. Each instruction in the Dockerfile creates a layer in the final image. Examples of Dockerfile commands include `FROM`, `COPY`, `RUN`, and `CMD`.
- **Docker Hub**: A cloud-based repository for Docker images. It allows users to share and distribute Docker images. It can be thought of as a version-controlled storage for container images.
- **Docker Compose**: A tool that allows you to define and manage multi-container Docker applications. It uses a YAML file (`docker-compose.yml`) to configure application services and run them with a single command (`docker-compose up`).
- **Docker Daemon**: The background service (also known as `dockerd`) that manages Docker containers and images on the host machine.
- **Docker Engine**: The core part of Docker that enables containerization. It includes the Docker Daemon and the CLI.

## Container Lifecycle and Management

- **Container Orchestration**: The process of managing the lifecycle of containers, especially in large-scale environments where there may be thousands of containers running. Kubernetes is a popular tool for orchestration.
- **Host**: The physical or virtual machine on which Docker (or any other container runtime) is installed and running containers. Containers share the host system's kernel but are isolated from other containers.
- **Repository**: A collection of Docker images, usually stored in a registry like Docker Hub or a private registry. It can store multiple versions of the same image.
- **Tag**: A label attached to an image version in a repository (e.g., `myapp:1.0`, where `1.0` is the tag). Tags help differentiate between versions of an image.
- **Volume**: A mechanism for persisting data generated and used by Docker containers. Volumes are stored on the host file system and can be shared between containers.
- **Bind Mount**: A type of volume where a specific directory on the host system is directly mounted into a container, allowing for real-time synchronization between the host and the container.
- **Layer**: Each step in a Dockerfile (like `RUN`, `COPY`, etc.) creates a new layer in an image. Layers are cached and reused to optimize image builds.

## Networking and Security in Docker

- **Docker Network**: A virtual network that allows Docker containers to communicate with each other. Types of networks include `bridge`, `host`, and `overlay`.
  - **Bridge Network**: The default network where containers on the same host can communicate.
  - **Host Network**: Binds the container to the host machine's network stack, allowing direct access to the host's network interfaces.
  - **Overlay Network**: Allows containers on different hosts to communicate securely.
- **Registry**: A service for storing and distributing Docker images. Docker Hub is a public registry, while private registries can also be set up for internal use.
- **Docker Content Trust (DCT)**: A security feature that ensures the authenticity and integrity of Docker images using cryptographic signing.
- **Namespace**: A Linux kernel feature used by Docker to isolate various aspects of a container's environment, such as process trees, network interfaces, and mount points, ensuring separation from other containers and the host.
- **Cgroups (Control Groups)**: A kernel feature that Docker uses to limit and prioritize the resources (CPU, memory, I/O) a container can use.

## Miscellaneous

- **Entrypoint**: The default executable that runs inside a container when it starts. It can be defined in the Dockerfile or overridden at runtime.
- **CMD**: A Dockerfile instruction that specifies the command to be run inside the container when it starts. `CMD` can be overridden by passing a command in `docker run`.
- **Build Context**: The directory containing the files required to build a Docker image. The build context is sent to the Docker Daemon during the build process.

## See also

- [Glossary of Kubernetes Terminology](Glossary_of_Kubernetes_Terminology.md)
- [Lesson Plan for Mastering Containers, Docker, and Kubernetes](Lesson_Plan_for_Mastering_Containers_Docker_and_Kubernetes.md)
