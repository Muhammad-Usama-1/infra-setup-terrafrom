Docker is a tool that lets you run your applications inside containers A container is like a little computer inside your actual computer, and it has everything your application needs to run (from lightweight os to code to dependencies). This makes it really easy to run your application on any computer because you don't have to worry about setting up the right environment or installing dependencies.

To use Docker, you'll first need to install it on your computer. Then, you'll create a "Dockerfile" which tells Docker how to build your container. A Dockerfile is just a text file with a bunch of instructions, like what base image to use and what commands to run when the container starts.

Once you have a Dockerfile, you can build your container using the docker build command. Then, you can run your container using the docker run command. And that's it! Your application will be running inside a container, which means you can run it on any computer with Docker installed.

## Explaination of Dockerfile (Just overview we will see docker run after that)

A Dockerfile is a text file that contains instructions for building a Docker image. A Docker image is a lightweight, stand-alone, executable package that includes everything needed to run a piece of software, including the application code, libraries, dependencies, and runtime.

A Dockerfile consists of a series of commands, each of which is executed in turn to build the final image. These commands can be used to specify the base image to use, install additional libraries and dependencies, copy files into the image, set environment variables, and run commands.

Here is an example of a simple Dockerfile that builds an image based on the latest version of Ubuntu and installs the Apache web server:

```yaml
FROM ubuntu:latest

RUN apt-get update && apt-get install -y apache2

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
```

The first line specifies the base image to use, which in this case is the latest version of Ubuntu. The second line runs the apt-get command to update the package manager and install the Apache web server. The third line exposes port 80, which is the default port used by the Apache web server. The fourth line specifies the command to run when the container is started, which in this case is the Apache web server.

To build a Docker image from a Dockerfile, you can use the docker build command, which takes the path to the Dockerfile as an argument. For example:

```bash
docker build .
```

This will build the Docker image using the instructions in the Dockerfile in the current directory. You can then use the docker run command to start a container based on the image you just built.

---
