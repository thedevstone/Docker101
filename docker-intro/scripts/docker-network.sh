# Networks
docker run -it --rm --network="bridge" --name="ubuntu_cont" ubuntu  # Use default bridge
root@ace3a0bf4cc9:/# apt-get update && apt install net-tools
root@ace3a0bf4cc9:/# ifconfig
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.17.0.2  netmask 255.255.0.0  broadcast 172.17.255.255
docker run -it --rm --network="host" --name="ubuntu_cont" ubuntu    # Use host network
root@ace3a0bf4cc9:/# apt-get update && apt install net-tools
root@ace3a0bf4cc9:/# ifconfig
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.65.3  netmask 255.255.255.0  broadcast 192.168.65.15

# Run commands
docker run -it --rm -p 8080:80 --name="ubuntu_cont" ubuntu            # Mapping 8080 to cont 80
> CONTAINER ID   IMAGE     COMMAND   CREATED          STATUS         PORTS                  NAMES
> 8e404e12b00b   ubuntu    "bash"    11 seconds ago   Up 8 seconds   0.0.0.0:8080->80/tcp   ubuntu_cont

