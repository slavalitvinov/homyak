#!/bin/bash

if type "teamviewer" > /dev/null; then
  echo "teamviewer is installed already"
  exit
fi

# the directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# the temp directory used, within $DIR
# omit the -p parameter to create a temporal directory in the default location
WORK_DIR=`mktemp -d -p "$DIR"`

# check if tmp dir was created
if [[ ! "$WORK_DIR" || ! -d "$WORK_DIR" ]]; then
  echo "Could not create temp dir"
  exit 1
fi

# deletes the temp directory
function cleanup {      
  rm -rf "$WORK_DIR"
  echo "Deleted temp working directory $WORK_DIR"
}

# register the cleanup function to be called on the EXIT signal
trap cleanup EXIT

cd "$WORK_DIR"
echo "Installing teamviewer"
wget https://download.teamviewer.com/download/linux/teamviewer-host_armhf.deb
sudo apt install ./teamviewer-host_armhf.deb
teamviewer
