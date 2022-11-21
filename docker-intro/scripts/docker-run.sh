# General status
docker info                 # Docker engine core info
docker version              # Check if engine and cli are installed

# SIMPLE create and run a container from a remote image
docker search ubuntu        # Search for the image ubuntu. Check for official status, more secure
> NAME                             DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
> ubuntu                           Ubuntu is a Debian-based Linux operating sys…   15159     [OK]
docker pull ubuntu          # Download the Ubuntu image (stampino)
> docker.io/library/ubuntu:latest
docker run ubuntu           # Create an instance (container) from the ubuntu image with a random name
docker run -it ubuntu       # Like above but attaches to STDIN
docker run -it --name="ubuntu_cont" ubuntu # Like above but with a container name
> root@4807e7c6f422:/#

# Manage images (we will see how to create images with Dockerfile)
docker images               # Show all images
docker rmi ubuntu           # Delete the ubuntu image

# Manage containers lifecyle
CTRL+P+Q                    # Detach from the container
docker ps [-a]              # Manage active [all] containers
> CONTAINER ID   IMAGE     COMMAND   CREATED         STATUS         PORTS     NAMES
> 4807e7c6f422   ubuntu   "bash"     3 seconds ago   Up 3 seconds             hopeful_bhabha
> 4efeff2c7d13   ubuntu   "bash"     4 seconds ago   Up 3 seconds             ubuntu_cont
docker pause ubuntu_cont    # Pause the container
docker unpause ubuntu_cont  # Unpause the container
docker stop ubuntu_cont     # Stops the container with name="ubuntu_cont"
docker stop 4efeff2c7d13    # Stops the container with id="4efeff2c7d13"
docker start ubuntu_cont    # Starts the container
docker restart ubuntu_cont  # Restarts the container
docker rm ubuntu_cont       # Delete the container

