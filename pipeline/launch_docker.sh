#!/bin/bash
# Set up docker daemon with a config file:
docker_config(){
	mkdir /etc/docker
	touch /etc/docker/daemon.json
	echo '{"storage-driver":"btrfs","debug":true}' > /etc/docker/daemon.json
}

# Start the docker daemon as a background task:
start_daemon(){
	dockerd --config-file=/etc/docker/daemon.json -p /var/run/docker-bootstrap.pid &
    sleep 10
}

docker_config
start_daemon
