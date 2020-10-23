#!/bin/bash
set -e
set -x

/bin/marlin-config-helper
cd /work/Marlin
/root/.platformio/penv/bin/platformio run -e $MARLIN_ENVIRONMENT
ls -al  .pio/build/$MARLIN_ENVIRONMENT/firmware.hex
