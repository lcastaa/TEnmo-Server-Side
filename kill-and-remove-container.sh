#!/bin/bash

# Get the container ID as an argument
container_id="$1"

# Check if the container is running
if docker ps | grep "$container_id" &> /dev/null; then
    # Stop the container
    docker stop "$container_id"
fi

# Remove the container
docker rm "$container_id"
