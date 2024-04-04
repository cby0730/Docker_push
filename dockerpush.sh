#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/null
then
    echo "Docker is not installed. Please install Docker and try again."
    exit 1
fi

# Initialize our own variables
dockerfile_path=""
username=""
image_name=""
image_tag=""

# Function to display help information
display_help() {
    echo "Usage: $0 [options...]"
    echo "Build and push a Docker image to Docker Hub"
    echo
    echo "Options:"
    echo "-p <path>     Path to Dockerfile"
    echo "-u <username> Docker Hub username"
    echo "-n <name>     Image name"
    echo "-t <tag>      Image tag"
    echo "-h            Display this help and exit"
    echo
    exit 1
}

# Handle command line arguments
while getopts ":p:u:n:t:h" opt; do
    case $opt in
        p) dockerfile_path="$OPTARG"
        ;;
        u) username="$OPTARG"
        ;;
        n) image_name="$OPTARG"
        ;;
        t) image_tag="$OPTARG"
        ;;
        h) display_help
        ;;
        \?) echo "Invalid option -$OPTARG" >&2
        ;;
    esac
done

# Prompt for user input if not provided through command line arguments
if [[ -z $dockerfile_path ]]; then
    echo "Enter your path to dockerfile:"
    read dockerfile_path
fi

if [[ -z $username ]]; then
    echo "Enter your Docker Hub username:"
    read username
fi

if [[ -z $image_name ]]; then
    echo "Enter your image name:"
    read image_name
fi

if [[ -z $image_tag ]]; then
    echo "Enter your image tag:"
    read image_tag
fi

# Check if already logged in to Docker Hub
if docker info | grep -q "Username: $username"; then
    echo "Already logged in to Docker Hub as $username"
else
    echo "Logging in to Docker Hub as $username"
    echo "Enter your Docker Hub password:"
    read -s password
    echo $password | docker login --username $username --password-stdin
fi

# Build the Docker image
echo "Building the Docker image: $image_name using Dockerfile: $dockerfile_path"
docker build -t $image_name $dockerfile_path

# Tag the Docker image if image_tag is not empty
if [[ -n $image_tag ]]; then
    echo "Tagging the Docker image with $username/$image_name:$image_tag"
    docker tag $image_name $username/$image_name:$image_tag
else
    echo "Tagging the Docker image with $username/$image_name"
    docker tag $image_name $username/$image_name
fi

# Push the Docker image to Docker Hub if image_tag is not empty
if [[ -n $image_tag ]]; then
    echo "Pushing the Docker image to Docker Hub with $username/$image_name:$image_tag"
    docker push $username/$image_name:$image_tag
else
    echo "Pushing the Docker image to Docker Hub with $username/$image_name"
    docker push $username/$image_name
fi
