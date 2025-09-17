# F1TENTH_Gym_ROS_Docker
- This is a VS Code Dev Containers implementation for using the `f1tenth_gym_ros` simulator
- It requires a Ubuntu host machine

### Quick Start
1. Clone the this repo
2. Pull the `src` code from the `.gitmodules` file by running 
```bash
git submodule update --init --force --remote
```
3. Open the subfolder with the ROS version you wish to use in VSCode, for example `ros2-docker-template/foxy`
4. Install Docker Engine with `apt` (not the VM Docker Desktop)**:** https://docs.docker.com/engine/install/ubuntu/#prerequisites
5. Install VSCode Dev Containers extension - https://code.visualstudio.com/docs/devcontainers/containers
    - More on Dev Containers at this tutorial by **Articulated Robotics**: https://www.youtube.com/watch?v=dihfA7Ol6Mw
6. Open VS Code Command Palette (**CTRL + P**), type `>Dev Containers: Reopen in Container`, and select it
7. VS Code will open a new window that contains an integrated IDE inside the Docker container, according to the instructions inside `.devcontainer`
