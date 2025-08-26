# ros2-docker-template
- This is a template for organizing ROS2 distributions into separate workspaces with Docker Engine
- Based on this guide: https://blog.robotair.io/the-complete-beginners-guide-to-using-docker-for-ros-2-deployment-2025-edition-0f259ca8b378
- It assumes a Ubuntu machine, and some basic knowledge of Docker and ROS2

## Quick Start
1. Install Docker Engine with `apt` (not the VM Docker Desktop)**:** https://docs.docker.com/engine/install/ubuntu/#prerequisites
2. Clone the rep in `/home/[YOUR_USER]]` 
3. Each workspace lives in its own folder named after the ROS2 distribution, such as `humble`, and includes 3 files:`Dockerfile`, `docker-compose.yml`, and ease-of-use scripts in `dev.sh`

## Daily commands
1. `cd` to the project in `ros2_workspace`
2. Copy your `src` directory for ROS2 workspace into the `[ROS_DISTRO]/src` folder - it is linked with Docker volumes to `src` inside the container
3. [`dev.sh`](http://dev.sh) shortcuts (replace `humble` with `jazzy` as needed)
    1. start a container and enter it
        
        ```bash
        ~/ros2_workspaces/humble/scripts/dev.sh start
        ```
        
    2. stop a container
        
        ```bash
        ~/ros2_workspaces/humble/scripts/dev.sh stop
        ```
        
    3. rebuild a container 
        
        ```bash
        ~/ros2_workspaces/humble/scripts/dev.sh rebuild
        ```
        
3. verify an environment (sanity check)
    
    ```bash
    # Check ROS2 installation
    ros2 --help
    
    # Verify distro
    echo $ROS_DISTRO
    ```
    
4. `docker ps` shows all running Docker containers
5. stop one container (for example Humble) before starting another (for example Jazzy)
6. open an additional terminal into a Docker container:
    
    ```bash
    docker compose exec ros2-srv-humble /bin/bash
    ```
    
7. inside a container, all the usual ROS commands apply (`colcon build`, `source install/setup.bash`, etc

## Setting up a new Docker container
1. Create a copy of an existing container folder, such as `~/ros2_workspaces/humble` and copy it with a new name, for ex for foxy it would be `~/ros2_workspaces/foxy`
2. In the Dockerfile, replace the image with the correct `osrf/ros` found at https://hub.docker.com/r/osrf/ros/tags, using the same format of `osrf/ros:[ROS_DISTRO]-desktop-full`
3. Replace all instances of `humble` with the new distribution, such as `foxy` across all 3 files (`Dockerfile, docker-compose.yml, dev.sh`)
