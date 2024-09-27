# libimobiledevice-docker

A docker image based on [Ubuntu docker image](https://hub.docker.com/_/ubuntu) for
running [libimobiledevice](https://github.com/libimobiledevice/libimobiledevice).

## Usage

### Clone the Git repo

```shell
git clone https://github.com/chungchungdev/libimobiledeivce-docker.git
cd libimobiledevice-docker
```

### Build the image

```shell
docker buildx build -t ubuntu/libimobiledevice:latest .
```

You can also use the environment variable `UBUNTU_VERSION`.

### Run the container

```shell
docker run -it -v /var/run:/var/run ubuntu/libimobiledevice:latest
```

