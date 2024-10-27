#!/bin/bash

# install nano if not already installed
# note: we assume a debian-based base image
if ! command -v httpie &> /dev/null; then
    echo "Installing nano..."
    sudo apt update && sudo apt install -y nano
fi

# set nano as default git editor
echo "export GIT_EDITOR="nano" >> /home/vscode/.bashrc