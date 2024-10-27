#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# WORKAROUND: running dotfiles as non-root throws permission errors when trying to access coder binary
# if current user is root, rerun the script as user vscode
if [ "$EUID" -eq 0 ]; then
    # copy the current dir to the vscode user home
    install -d /home/vscode/dotfiles
    cp -r "${SCRIPT_DIR}/*" /home/vscode/dotfiles
    chown -R vscode:vscode /home/vscode/dotfiles

    su - vscode -c "bash /home/vscode/dotfiles/install.sh"
    exit
fi

./git/set-editor-to-nano