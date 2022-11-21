# Create a container and run commands inside
docker run -it --name="ubuntu_cont" ubuntu  # Create a new container
root@477f547a8618:/# apt-get update && apt install -y net-tools
root@477f547a8618:/# ifconfig
root@477f547a8618:/# exit
docker ps -a 
> CONTAINER ID   IMAGE     COMMAND   CREATED              STATUS                     PORTS     NAMES
> 477f547a8618   ubuntu    "bash"    About a minute ago   Exited (0) 2 seconds ago             ubuntu_cont
docker run -it --name="ubuntu_cont2" ubuntu     # Creates a new instance
root@477f547a8618:/# ifconfig                   # Not found
docker start ubuntu_cont                        # Starting ubuntu_cont restore the container state

# Run commands
docker run -it --rm --name="ubuntu_cont" ubuntu    # Creates a new instance and remove when it stops
docker run -it --rm --name="ubuntu_cont" -e "PIPPO=PLUTO" ubuntu # Init a variable
root@bfc149fdbbf3:/# echo $PIPPO
> PLUTO
docker run -it -d --rm --name="ubuntu_cont" ubuntu # Run in background like CTRL+P+Q
docker exec -it ubuntu_cont echo "hello"        # Exec a command inside a background container
> hello
docker exec -it -d ubuntu_cont echo "hello"     # Exec a background command inside a background container
docker attach ubuntu_cont                       # Attach to the container, move it in foreground
root@7904cdb7a55a:/#
CTRL+P+Q                                        # Detach
