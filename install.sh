#!/bin/bash

# The path to the script
script_path="dockerpush.sh"

# Check if the script exists
if [[ ! -f $script_path ]]; then
    echo "The script $script_path does not exist."
    exit 1
fi

# Make the script executable
chmod u+x $script_path

# Move the script to the appropriate directory
if [[ -d /bin ]]; then
    sudo cp $script_path /bin/dockerpush
    sudo chmod +x /bin/dockerpush
else
    sudo cp $script_path ~/bin/dockerpush
    sudo chmod +x ~/bin/dockerpush
fi

echo "The script has been installed. You can now run it with 'dockerpush'."
echo "Run 'dockerpush -h' for help."
