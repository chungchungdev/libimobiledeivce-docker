# syntax=docker/dockerfile:1
FROM ubuntu:latest
LABEL authors="chung"
LABEL description="To set up build environment for building libimobiledevice binary files."

# install necessary build tools
RUN apt update
RUN apt -y install \
    build-essential \
    pkg-config \
    checkinstall \
    git \
    autoconf \
    automake \
    libtool-bin \
    libplist-dev \
    libusbmuxd-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    usbmuxd

# ---------------------------------------------------------------------------

# build libimobiledevice-glue-dev
ADD --keep-git-dir=true https://github.com/libimobiledevice/libimobiledevice-glue.git /home
WORKDIR=/home/libimobiledevice-glue

# ---------------------------------------------------------------------------

# build libtatsu-dev
ADD --keep-git-dir=true https://github.com/libimobiledevice/libtatsu.git /home
WORKDIR=/home/libtatsu

# ---------------------------------------------------------------------------

# build libimobiledevice
ADD --keep-git-dir=true https://github.com/libimobiledevice/libimobiledevice.git /home
WORKDIR=/home/libimobiledevice