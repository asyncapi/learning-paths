#!/bin/bash

# Install necessary prerequisites
echo "We are going to install Nodejs and NPM first."
curl --silent -sL https://deb.nodesource.com/setup_current.x -o /tmp/nodesource_setup.sh
bash /tmp/nodesource_setup.sh
apt-get install -y -q nodejs

# Install AsyncAPI CLI
echo "Installing AsyncAPI CLI..."
npm install -g @asyncapi/cli
echo "All set!!"