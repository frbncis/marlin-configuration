This repository contains the Marlin build configuration for my Ender 3.

Included is a simple tool to manage Marlin build configurations alongside the build environment.

`Configuration.h` and `Configuration_adv.h` are stored in the `configs` folder in the project repository.

To checkout specific Marlin version, you can use `init.sh`.

```
./marlin-config-helper 2.0.1
```

This will download the requested Marlin version and symlink the all the files in `config` to `Marlin/Marlin`. You can then use the Arduino IDE to compile and upload the firmware to the printer.

The script will also store the version number in `.marlin.lock`; this file is also checked in alongside the Marlin build configuration files.

This makes it possible later on to re-initialize the build environment by simply running

```
./marlin-config-helper
```
