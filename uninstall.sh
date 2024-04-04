#!/bin/bash

# Check if the command exists in /bin or ~/bin
if [[ -f /bin/dockerpush ]]; then
    sudo rm /bin/dockerpush
    echo "The command 'dockerpush' has been removed from /bin."
elif [[ -f ~/bin/dockerpush ]]; then
    rm ~/bin/dockerpush
    echo "The command 'dockerpush' has been removed from ~/bin."
else
    echo "The command 'dockerpush' does not exist."
    exit 1
fi