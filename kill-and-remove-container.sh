#!/bin/bash

# Get the container name as an argument
container_name="$1"

# Get the container ID based on the container name
container_id="$(docker ps -aqf "name=$container_name")"

# Check if the container ID is not empty
if [ ! -z "$container_id" ]; then
    # Check if the container is running
    if docker ps | grep "$container_id" &> /dev/null; then
        # Stop the container
        docker stop "$container_id"
    fi

    # Remove the container
    docker rm "$container_id"
else
    echo "Container not found: $container_name"
fi

