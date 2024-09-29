# syntax=docker/dockerfile:1
ARG UBUNTU_VERSION=latest
FROM ubuntu:${UBUNTU_VERSION}

ARG TIMEZONE=Etc/UTC
RUN apt update
# set up timezone for dependencies
RUN DEBIAN_FRONTEND=noninteractive TZ=$TIMEZONE apt -y install tzdata
# install common dependencies
RUN apt -y install \
    build-essential \
    pkg-config \
    checkinstall \
    git \
    autoconf \
    automake \
    libtool-bin \
    libssl-dev

# ---------------------------------------------------------------------------
#                               build libplist
WORKDIR /home
RUN git clone https://github.com/libimobiledevice/libplist.git
WORKDIR /home/libplist

RUN <<EOF
./autogen.sh --enable-debug --without-cython
make
make install
EOF

# ---------------------------------------------------------------------------
#                       build libimobiledevice-glue-dev
WORKDIR /home
RUN git clone https://github.com/libimobiledevice/libimobiledevice-glue.git
WORKDIR /home/libimobiledevice-glue

RUN <<EOF
./autogen.sh
make
make install
EOF

# ---------------------------------------------------------------------------
#                            build libtatsu-dev
WORKDIR /home
RUN git clone https://github.com/libimobiledevice/libtatsu.git
WORKDIR /home/libtatsu
# install dependencies
RUN apt install -y libcurl4-openssl-dev

RUN <<EOF
./autogen.sh
make
make install
EOF

# ---------------------------------------------------------------------------
#                               build libusbmuxd
WORKDIR /home
RUN git clone https://github.com/libimobiledevice/libusbmuxd.git
WORKDIR /home/libusbmuxd

RUN <<EOF
./autogen.sh
make
make install
EOF

# ---------------------------------------------------------------------------
#                           build libimobiledevice
WORKDIR /home
RUN git clone https://github.com/libimobiledevice/libimobiledevice.git
WORKDIR /home/libimobiledevice

RUN <<EOF
./autogen.sh
make
make install
EOF

# ---------------------------------------------------------------------------
#                               build usbmuxd
WORKDIR /home
RUN git clone https://github.com/libimobiledevice/usbmuxd.git
WORKDIR /home/usbmuxd
#
RUN apt install -y \
    libusb-1.0-0-dev \
    udev

RUN <<EOF
./autogen.sh
make
make install
EOF

WORKDIR /home