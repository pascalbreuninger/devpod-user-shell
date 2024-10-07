#!/usr/bin/env bash

get_shell_path() {
    case "$1" in
        "bash")
            echo "/usr/bin/bash"
            ;;
        "sh")
            echo "/usr/bin/sh"
            ;;
        "zsh")
            echo "/usr/bin/zsh"
            ;;
        *)
            echo "Unknown shell: $1" >&2
            return 1
            ;;
    esac
}
 
USER_SHELL=${USER_SHELL:-"bash"}
SHELL_PATH=$(get_shell_path "$USER_SHELL")
CURRENT_USER=$(whoami)
echo "Setting login shell to $USER_SHELL for user $CURRENT_USER"


sudo chsh -s $SHELL_PATH $CURRENT_USER
