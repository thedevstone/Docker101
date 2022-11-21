# Dockerfile keywords
FROM            # Base image for building the new image
MAINTAINER      # Name of maintainer
RUN             # Command to be executed during image creation
COPY            # Copy from host to the image
ADD             # Same as COPY but with URL option
ENV             # Set a local environment inside future container
CMD             # Command to be executed when container is CREATED form image
ENTRYPOINT      # Similar to CMD, command executed when container is RUNNING
WORKDIR         # The working directory for the container when created

# Dockerfile commands
docker build -t rest-api-server_image . # Build a new image called 'rest-api-server_image' using Dockerfile inside '.' folder.
docker images                           # List images
docker rmi rest-api-server_image        # Delete the image created with Dockerfile
docker run -it --rm -p 5000:80 -d --name rest-api-server_container rest-api-server_image # Create a container from the image
docker image prune --all                # Remove images without associated container, very powerful