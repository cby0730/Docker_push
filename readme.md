# Docker Push

This project provides a simple Bash script to build and push Docker images to Docker Hub.

## Features

- Checks if Docker is installed
- Accepts necessary parameters from the command line, or prompts for input interactively
  ```bash
  -p <path>     Path to Dockerfile
  -u <username> Docker Hub username
  -n <name>     Image name
  -t <tag>      Image tag
  -h            Display this help and exit
  ```
- Automatically logs in to Docker Hub (If it is needed)
- Builds the Docker image
- Tags the Docker image
- Pushes the Docker image to Docker Hub

## Usage

1. Clone this repository.

```bash
git clone git@github.com:cby0730/Docker_push.git
cd Docker_push
```

2. Use the `install.sh` script to install the `dockerpush` command in your system path:

```bash
chmod +x install.sh
./install.sh
```

3. You can now use the script with the dockerpush command:

```bash
# You can input your information separately, without providing all the parameters at once. 
# It is recommended to input the desired parameters first, such as the path to the Dockerfile.
dockerpush -p /path/to/Dockerfile -u your-username -n image-name -t image-tag

# Or you can input info later
dockerpush
```

4. To remove the command, run the `uninstall.sh` script:
```bash
chmod +x uninstall.sh
./uninstall.sh
```

5. If you don't want to install it as a shell command, you can directly run the `dockerpush.sh` script:

```bash
chmod +x dockerpush.sh
./dockerpush.sh -p /path/to/Dockerfile
```
