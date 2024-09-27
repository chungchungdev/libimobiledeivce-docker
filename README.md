# libimobiledevice-docker

A docker image for running libimobiledevice based on [ubuntu docker image](https://hub.docker.com/_/ubuntu).

## Usage

### Cloning the repo
```shell
git clone 
cd libimobiledevice-docker
```

### Building the image
```shell
docker buildx build -t ubuntu/libimobiledevice:latest .
```
You can also use the environment variable `UBUNTU_VERSION`.

### Running the container
```shell
docker run -it -v /var/run:/var/run ubuntu/libimobiledevice:latest
```

