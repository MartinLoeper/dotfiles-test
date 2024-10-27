#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
NESTO_DOTFILES_DEST_DIR="${SCRIPT_DIR}"

# WORKAROUND: running dotfiles as non-root throws permission errors when trying to access coder binary
# if current user is root, rerun the script as user vscode
if [ "$EUID" -eq 0 ]; then
    # copy the current dir to the vscode user home
    NESTO_DOTFILES_DEST_DIR=/home/vscode/dotfiles
    install -d "${NESTO_DOTFILES_DEST_DIR}"
    cp -r "${SCRIPT_DIR}/"* "${NESTO_DOTFILES_DEST_DIR}"
    chown -R vscode:vscode "${NESTO_DOTFILES_DEST_DIR}"

    su - vscode -c "bash ${NESTO_DOTFILES_DEST_DIR}/install.sh"
    exit
fi

"${NESTO_DOTFILES_DEST_DIR}/git/set-editor-to-nano"