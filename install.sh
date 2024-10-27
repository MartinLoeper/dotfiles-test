#!/bin/bash

# if current user is root, rerun the script as user vscode
if [ "$EUID" -eq 0 ]; then
    su - vscode -c "bash $0"
    exit
fi

./git/set-editor-to-nano