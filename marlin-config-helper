#!/bin/bash
set +x

MARLIN_CACHE=$PWD/cache
MARLIN="Marlin"

MARLIN_LOCKFILE=.marlin.lock

if [ -e $1 ]; then
    echo "Sourcing desired Marlin version from $MARLIN_LOCKFILE"
    MARLIN_VERSION=$(cat .marlin.lock)
else
    echo "Sourcing desired Marlin version from argument"
    MARLIN_VERSION=$1
fi 

MARLIN_DOWNLOAD_URL="https://codeload.github.com/MarlinFirmware/Marlin/tar.gz/$MARLIN_VERSION"

if [ ! -e $MARLIN_CACHE ]; then
    echo "Creating cache folder..."
    mkdir -p $MARLIN_CACHE
fi

if [ ! -e $MARLIN_CACHE/$MARLIN_VERSION.tar.gz ]; then
    echo "Downloading Marlin $MARLIN_VERSION from $MARLIN_DOWNLOAD_URL..."
    curl $MARLIN_DOWNLOAD_URL -o $MARLIN_CACHE/$MARLIN_VERSION.tar.gz 
fi

# Check the lock file to see what version of Marlin is currently
# configured.
if [ ! -e $MARLIN ] || ! grep -q "$MARLIN_VERSION" "$MARLIN_LOCKFILE"; then
    echo "Initializing Marlin directory to $MARLIN_VERSION..."

    rm -rf Marlin
    tar xf $MARLIN_CACHE/$MARLIN_VERSION.tar.gz
    mv Marlin-$MARLIN_VERSION $MARLIN

    # Set up symlinks for configuration
    # files stored outside of the Marlin tree
    cp -f --symbolic-link $PWD/configs/* $PWD/Marlin/Marlin
    echo $MARLIN_VERSION > $MARLIN_LOCKFILE
fi

echo "Done!"
