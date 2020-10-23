#!/bin/bash
set -e
set -x

FIRMWARE_OUTPUT=.pio/build/$MARLIN_ENVIRONMENT/firmware.hex

/bin/marlin-config-helper
cd /work/Marlin
/root/.platformio/penv/bin/platformio run -e $MARLIN_ENVIRONMENT
ls -al $FIRMWARE_OUTPUT
cp $FIRMWARE_OUTPUT /work/build
