# 1 Docker

<p align="center">
  <img src="fotos/docker/whatIsDocker.jpg" width="500" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);" />
</p>

## 1 What is Docker?

Docker is an open-source platform that makes it easy to develop your applications in containers. These containers ensure that your projects run in an isolated environment. It doesn't matter which operating system you use because everything is included in the container.

Docker is becoming increasingly popular. Since 2015, the use of Docker has increased by 25% among companies. Currently, it is widely used.

<p align="center">
  <img src="fotos/docker/DockerBehavior.png" width="700" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

---

## 1.2 The three main components of Docker

Within Docker, there are three very important essential components:

- **Dockerfile** 📝  
  A Dockerfile can be compared to the DNA of an application. It contains the instructions/code for creating an image.

- **Image** 📷  
  An image is a ready-to-use software package with all dependencies. Multiple containers can be started from an image.

- **Container** 📦  
  A container is a running instance of an image. Containers are lightweight and isolated.

---

## 1.3 Why use Docker?

### ✅ Advantages

✔ **Time-saving** – Developers can quickly and easily set up a consistent development environment.  
✔ **Collaboration** – Teams can easily share the same configuration.  
✔ **Space-saving** – You don't need to install heavy dependencies locally.

### ❌ Disadvantages

❌ **Steep learning curve** – Docker can be challenging for beginners.  
❌ **No GUI support** – Docker is primarily intended for backend processes.  
❌ **Command-line based** – Working with Docker requires knowledge of terminal commands.

---

---

# 2 How to install Docker?

<p align="center">
  <img src="fotos/docker/dockerFoto.png" width="500" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

## 2.1 Installing Docker

There are several ways to install Docker. In this documentation, I will explain step by step how to install Docker. It is important to note that I will only explain how to do this on a Windows system.  
For Windows, we use **Docker Desktop**.

Docker Desktop can be installed in two ways:

1. Via the Installer
2. Via the Console

Both methods are explained below.

---

## 2.1.1 Download Docker Desktop

Before we can install Docker, we need to download Docker Desktop. This file is required for both installation methods.

You can download Docker Desktop from the official website:  
👉 [Docker Desktop download](https://www.docker.com/101-tutorial/)

Click the link and then click **Download Docker Desktop**.

---

## 2.2 Installation via the Installer

Make sure you have downloaded the Docker Desktop installer before you begin.

### Steps:

1. Double-click the downloaded **Docker Desktop Installer** file to start the installation. 🖱️
2. A window will appear where you can choose to add a desktop shortcut. 📋
3. Click **OK** and wait for Docker to extract all files. ⏳
4. Once the installation is complete and you see the message **Installation Succeeded**, click **Close**. ✅
5. Open Docker Desktop, and voilà, Docker is installed! 🎉

<p align="center">
  <img src="fotos/docker/fotoDockerDesktop.png" width="500" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

---

## 2.3 Installation via the Console

For this method, you also need to download the Docker Desktop installer first.

### Steps:

1. Open the **Command Prompt** (cmd) or **PowerShell**.
2. Navigate to the folder where the Docker Desktop Installer is stored using the command:

   ```sh
   cd Downloads
   ```

3. Execute this command to install Docker Desktop:  
   Via the Terminal:
   ```sh
   "Docker Desktop Installer.exe" install
   ```
   Via PowerShell:
   ```sh
   Start-Process 'Docker Desktop Installer.exe' -Wait install
   ```
   Via the Windows Command Prompt:
   ```sh
   start /w "" "Docker Desktop Installer.exe" install
   ```
4. After a successful installation, you will see a message in the console indicating the process is complete.

<p align="center">
  <img src="fotos/docker/dockerConsole.png" width="500" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

5. Open **Docker Desktop**.
6. Choose whether you want a desktop shortcut and click **Next**.
7. Click **Close** and restart Docker.

---

---

# 3 Docker Commands

Docker commands can be divided into 4 categories:

1. Images
2. Docker Hub
3. General Commands
4. Containers

I will go over these 4 commands for you. I say 4 because we have already covered the installation above. If you're unsure how to do it, feel free to review it again.

## 3.1 Images

---

1. This first command is to create a Docker image from a DockerFile.
   ```sh
   docker build -t my-image .
   ```

- **-t** is a tag you give to the image. This can be a name, a name with a version, or a name with a version and a tag.
- **.** is the directory where the DockerFile is located.

---

2. This command creates a Docker image from a DockerFile without using the cache.
   ```sh
   docker build -t <image_name> . –no-cache
   ```

- **<image_name>** This is the name of the image you want to create.
- **.** is the directory where the DockerFile is located.
- **–no-cache** is an option that disables the cache. This can be useful if you want to create the image from a modified DockerFile.

---

3. This command is used to display a list of all Docker images.
   ```sh
   docker images
   ```

- This command shows all Docker images on your computer. You can also use a specific command to search for a particular image, e.g., **docker images -a** to display all images, including unused ones.

---

4. This command is used to remove a Docker image.
   ```sh
   docker rmi <image_name>
   ```

- **rmi** This means remove.
- **<image_name>** This is the name of the image you want to remove.

---

5. This command removes all unused images.
   ```sh
   docker image prune
   ```

- **prune** This means to trim or remove unused items.

---

## 3.2 Docker Hub 🌐

Docker Hub is a platform where you can store and share your own Docker images with others. You can also download and use images from others. To use Docker Hub, you need to create an account first. After that, you can upload your own images and download images from others.

1. This command is used to log in to Docker.
   ```sh
   docker login -u <username>
   ```

- **login** This means log in.
- **-u** This is the option for logging in with a username.
- **<username>** This is your username on Docker Hub.

---

2. This command is used to upload a Docker image to Docker Hub.
   ```sh
   docker push <username>/<image_name>
   ```

- **push** This means uploading the image.
- **<username>** This is your username on Docker Hub.
- **<image_name>** This is the name of the image you want to upload.

---

3. This command is used to search for an image on Docker Hub.
   ```sh
   docker search <image_name>
   ```

- **search** This means search.
- **<image_name>** This is the name of the image you want to search for.

---

4. This command is used to download an image from Docker Hub.
   ```sh
   docker pull <image_name>
   ```

- **pull** This means downloading the image.
- **<image_name>** This is the name of the image you want to download.

---

## 3.3 General Commands ⚙️

1. This command is used to start the Docker Daemon or Docker Engine.
   ```sh
   docker -d
   ```

- **-d** This means the Docker Daemon is started in the background.

---

2. This command is used to request help with Docker. You can use **--help** with any subcommand.
   ```sh
   docker --help
   ```

- **--help** This means you want help. You can use this with any subcommand.

---

3. This command is used to display information.
   ```sh
   docker info
   ```

- **info** This means you want to see information. This provides details about Docker.

---

## 3.4 Container Commands

1. This command is used to create a new container from an image. You can use **-it** to create an interactive shell.
   ```sh
   docker run --name <container_name> <image_name>
   ```

- **run** This means you want to create a new container.
- **--name** This means you want to give the container a name.
- **<container_name>** This is the name of the container.
- **<image_name>** This is the name of the image you want to use.

---

2. This command is used to start an existing container. This command also publishes the container's ports to the host.
   ```sh
   docker run -p <host_port>:<container_port> <image_name>
   ```

- **run** This means you want to start an existing container.
- **-p** This means you want to publish the ports.
- **<host_port>** This is the port on the host you want to use.
- **<container_port>** This is the port in the container you want to use.
- **<image_name>** This is the name of the image you want to use.

---

3. This command is used to run a container in the background.
   ```sh
   docker run -d <image_name>
   ```

- **run** This means you want to run a container.
- **-d** This means you want to run the container in the background.
- **<image_name>** This is the name of the image you want to use.

---

4. This command is used to start or stop a container.
   ```sh
   docker start|stop <container_name>
   ```

- **start** This means you want to start the container.
- **stop** This means you want to stop the container.
- **<container_name>** This is the name of the container you want to start or stop.

---

5. This command is used to remove a stopped container.
   ```sh
   docker rm <container_name>
   ```

- **rm** This means you want to remove the container.
- **<container_name>** This is the name of the container you want to remove.

---

6. This command is used to open a shell in a running container.
   ```sh
   docker exec -it <container_name> sh
   ```

- **exec** This means you want to execute a command in a container.
- **-it** This means you want to open an interactive shell.
- **<container_name>** This is the name of the container you want to open.
- **sh** This is the shell you want to open.

---

7. This command is used to view the log files of a specific container.
   ```sh
   docker logs -f <container_name>
   ```

- **logs** This means you want to view the log files.
- **-f** This means you want to view the log files in real-time.
- **<container_name>** This is the name of the container you want to view.

---

8. This command provides detailed information about a specific container.
   ```sh
   docker inspect <container_name>
   ```

- **inspect** This means you want detailed information about the container.
- **<container_name>** This is the name of the container you want to inspect.

---

9. This command displays a list of all Docker containers currently running.
   ```sh
   docker ps
   ```

- **ps** This means you want a list of all running containers.

---

10. This command displays a list of all Docker containers ever created.

```sh
docker ps --all
```

- **ps** This means you want a list of all containers.
- **--all** This means you want to see all containers.

---

11. This command is used to view the resource usage statistics of active Docker containers.

```sh
docker container stats
```

- **container** This means you are referring to the containers.
- **stats** This means you want to view the statistics.

---

---

# 4 Dockerfile

## 4.1 What is a Dockerfile?

As we all know by now, we need a Dockerfile to build a Docker container, or more accurately, an image. But what exactly is a Dockerfile?  
Let me explain it clearly. A Dockerfile is essentially a text document containing instructions for building Docker images. It's like a recipe for creating a Docker image. Docker will automatically read this file and execute the instructions to build a Docker image. So, it's like a script, but for Docker.

We were tasked with creating our own Dockerfile. I created a simple Dockerfile with a Python file. What this does is display "Hello World" on the website.

<p align="center">
  <img src="fotos/dockerfile.png" width="500" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);"/>
</p>

## 4.2 The Dockerfile

I will now explain the Dockerfile step by step.

---

The first line of code is:

```sh
FROM python:3.9-slim
```

This means we are using the official Python image as the base of the image.

---

The second line of code is:

```sh
WORKDIR /app
```

This sets the working directory.

---

Next, we have:

```sh
COPY requirements.txt .
```

This copies the requirements from the requirements.txt file to the container.

---

After that, we have:

```sh
RUN pip install --no-cache-dir -r requirements.txt
```

This ensures that the requirements we just copied are downloaded.

---

The penultimate line is:

```sh
COPY . .
```

This copies the rest of the application to the container. So, it copies all other files we have coded in.

---

The very last line of code is:

```sh
CMD ["python", "app.py"]
```

This sets the command to be executed when the container starts. In this case, it's app.py.

---

---

# 5 Docker Compose

## 5.1 What is Docker Compose?

Docker Compose is essentially a tool that helps you manage and configure multiple Docker containers. Docker Compose consists of a YAML file where the configuration of the containers is defined.  
You can do a lot with Docker Compose; here are a few examples:

- You can define and configure multiple containers.
- You can start and stop containers.
- What's also very handy is that you can enable communication between containers.

## 5.2 Docker Compose file with explanation

I created an example of a Docker Compose file. I will first provide the entire file and then explain it.

```sh
version: '3.8'

services:
  web:
    build:
      context: ./web
    ports:
      - "5000:5000"
    depends_on:
      - db
    environment:
      - MONGO_URI=mongodb://db:27017/mydatabase

  db:
    image: mongo
    ports:
      - "27017:27017"
    volumes:
      - mongo_data:/data/db

volumes:
  mongo_data:
```

The first line is `version: '3.8'`. This tells Docker Compose which version of Docker Compose we are using.

We then have the line `services:`, where the different services are defined.

The first service we have is `web`. There are a few important things:  
First, the `ports`, which is the port we use to host our website.  
Then we have `depends_on`, which ensures that the database section is started before the website is started.

The second service we have is the `mongo database`. This is also clearly defined with a port.
