#!/bin/bash

# the directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# sudo apt-get update
# sudo apt-get upgrade

echo Installing TeamViewer
exec "$DIR/install_teamviewer.sh" 
echo Installing git
sudo apt-get install git
