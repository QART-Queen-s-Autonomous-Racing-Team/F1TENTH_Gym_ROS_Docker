#!/bin/bash

# Detect ROS distro from path
SCRIPT_DIR="$(dirname "$0")"
ROS_DISTRO=humble
echo "[dev.sh] SCRIPT_DIR set to $SCRIPT_DIR"
echo "[dev.sh] ROS_DISTRO set to $ROS_DISTRO"

# Set environment variables for Docker Compose
export USER_UID=$(id -u)
export USER_GID=$(id -g)
export USERNAME=$(whoami)
export ROS_DISTRO=$ROS_DISTRO

# Change to docker directory
cd "$SCRIPT_DIR/../docker"
CURR_PATH=$(pwd)
echo "[dev.sh] Moved to path $CURR_PATH"

# Print new line for clarity
echo ""

# Function to start the development environment
start_dev() {
    echo "Starting ROS2 $ROS_DISTRO development environment..."
    docker compose up -d
    docker exec -it ros2-cont-humble /bin/bash
}

# Function to stop the environment
stop_dev() {
    echo "Stopping ROS2 $ROS_DISTRO development environment..."
    docker compose down
}

# Function to rebuild the container
rebuild() {
    echo "Rebuilding ROS2 $ROS_DISTRO container..."
    docker compose down
    docker compose build --no-cache
}

# Function to show container status
status() {
    echo "ROS2 $ROS_DISTRO container status:"
    docker compose ps
}

case "$1" in
    start|"")
        start_dev
        ;;
    stop)
        stop_dev
        ;;
    rebuild)
        rebuild
        ;;
    status)
        status
        ;;
    *)
        echo "Usage: $0 {start|stop|rebuild|status}"
        echo "  start (default): Start and enter the development container"
        echo "  stop: Stop the development container"
        echo "  rebuild: Rebuild the container from scratch"
        echo "  status: Show container status"
        echo ""
        echo "Detected ROS distro: $ROS_DISTRO"
        exit 1
        ;;
esac
