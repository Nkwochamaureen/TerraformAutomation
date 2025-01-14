#!/bin/bash

# Path to the MkDocs project directory
WATCH_DIRS="."

# List containers using the same image or port and stop them
existing_container=$(docker ps -q --filter "ancestor=$DOCKER_IMAGE_NAME" --filter "status=running")
if [ ! -z "$existing_container" ]; then
  docker stop "$existing_container"
  docker rm "$existing_container"
fi

# Ensure chokidar is installed
if ! command -v chokidar &> /dev/null; then
  echo "Error: chokidar-cli is not installed. Please install it with 'npm install -g chokidar-cli'."
  exit 1
fi

# Function to rebuild the Docker image and run the container
rebuild_and_run_docker() {
  echo "Change detected. Rebuilding Docker image and restarting the container..."
  
  # Build the Docker image
  docker build -t gcr.io/my_mkdocs_site/terraform-docs:latest -f "C:\\Users\\Admin\\OneDrive - Federal University of Technology, Owerri\\Documents\\TerraformAutomation\\TerraformAutomation\\docker\\Dockerfile" . || { echo "Docker build failed"; exit 1; }

  # Stop and remove the running container, if exists
  docker stop "$DOCKER_CONTAINER_NAME" 2>/dev/null || true
  docker rm "$DOCKER_CONTAINER_NAME" 2>/dev/null || true

  # Run the updated Docker container
  docker run -d -p 8080:8080 "gcr.io/my_mkdocs_site/terraform-docs:latest" || { echo "Docker run failed"; exit 1; }

  echo "Docker container restarted with the new build."
}

# Start watching all files and directories in the MkDocs directory
echo "Starting file watcher with Chokidar..."
chokidar "$WATCH_DIRS/**/*" --silent --ignore "C:/DumpStack.log.tmp" --command "bash -c '$(declare -f rebuild_and_run_docker); rebuild_and_run_docker'"











