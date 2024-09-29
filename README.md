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
docker buildx build -t ubuntu/libimobiledevice:latest --build-arg TIMEZONE=$(cat /etc/timezone) .
```

#### Environment Variable

`UBUNTU_VERSION`<br>

* Default: `latest`

`TIMEZONE`<br>

* Default: `Etc/UTC`

### Run the container

```shell
docker run -it -v /var/run:/var/run ubuntu/libimobiledevice:latest
```

### Utilities

The library bundles the following command-line utilities in the tools directory:

| Utility                    | Description                                                        |
|----------------------------|--------------------------------------------------------------------|
| `idevice_id`               | List attached devices or print device name of given device         |
| `idevicebackup`            | Create or restore backup for devices (legacy)                      |
| `idevicebackup2`           | Create or restore backups for devices running iOS 4 or later       |
| `idevicebtlogger`          | Capture Bluetooth HCI traffic from a device (requires log profile) |
| `idevicecrashreport`       | Retrieve crash reports from a device                               |
| `idevicedate`              | Display the current date or set it on a device                     |
| `idevicedebug`             | Interact with the debugserver service of a device                  |
| `idevicedebugserverproxy`  | Proxy a debugserver connection from a device for remote debugging  |
| `idevicediagnostics`       | Interact with the diagnostics interface of a device                |
| `ideviceenterrecovery`     | Make a device enter recovery mode                                  |
| `ideviceimagemounter`      | Mount disk images on the device                                    |
| `ideviceinfo`              | Show information about a connected device                          |
| `idevicename`              | Display or set the device name                                     |
| `idevicenotificationproxy` | Post or observe notifications on a device                          |
| `idevicepair`              | Manage host pairings with devices and usbmuxd                      |
| `ideviceprovision`         | Manage provisioning profiles on a device                           |
| `idevicescreenshot`        | Gets a screenshot from the connected device                        |
| `idevicesetlocation`       | Simulate location on device                                        |
| `idevicesyslog`            | Relay syslog of a connected device                                 |
| `afcclient`                | Interact with device filesystem via AFC/HouseArrest                |

Please consult the usage information or manual pages of each utility for a
documentation of available command line options and usage examples like this:

```shell
ideviceinfo --help
man ideviceinfo
```